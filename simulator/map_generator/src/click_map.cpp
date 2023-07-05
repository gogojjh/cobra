#include <pcl/point_cloud.h>
#include <pcl/point_types.h>
// #include <pcl/search/kdtree.h>
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/PoseWithCovarianceStamped.h>
#include <geometry_msgs/Vector3.h>
#include <math.h>
#include <nav_msgs/Odometry.h>
#include <pcl/kdtree/kdtree_flann.h>
#include <pcl_conversions/pcl_conversions.h>
#include <ros/console.h>
#include <ros/ros.h>
#include <sensor_msgs/PointCloud2.h>

#include <Eigen/Eigen>
#include <iostream>
#include <random>

using namespace std;

const double MIN_HEIGHT = -1.0;
const double MAX_HEIGHT = 3.0;
const double RESO = 0.2;
const double MIN_X = -15.0;
const double MAX_X = 15.0;
const double MIN_Y = -15.0;
const double MAX_Y = 15.0;

ros::Publisher all_map_pub_;
sensor_msgs::PointCloud2 map_msg_;
pcl::PointCloud<pcl::PointXYZ> map_cloud_;

ros::Subscriber click_sub_;
ros::Subscriber click_pose_sub_;
vector<Eigen::Vector3d> points_;
double len2_;

void clickCallback(const geometry_msgs::PoseStamped& msg) {
  double x = msg.pose.position.x;
  double y = msg.pose.position.y;
  points_.push_back(Eigen::Vector3d(x, y, 0));
  if (points_.size() < 2) return;

  // Generate wall using two points
  Eigen::Vector3d p1 = points_[0];
  Eigen::Vector3d p2 = points_[1];
  points_.clear();

  Eigen::Vector3d dir1 = (p2 - p1).normalized();
  double len = (p2 - p1).norm();
  Eigen::Vector3d dir2;
  dir2[0] = -dir1[1];
  dir2[1] = dir1[0];

  pcl::PointXYZ pt_random;
  for (double l1 = 0.0; l1 <= len + 1e-3; l1 += RESO) {
    Eigen::Vector3d tmp1 = p1 + l1 * dir1;
    for (double l2 = -len2_; l2 <= len2_ + 1e-3; l2 += RESO) {
      Eigen::Vector3d tmp2 = tmp1 + l2 * dir2;
      for (double h = MIN_HEIGHT; h < MAX_HEIGHT; h += RESO) {
        pt_random.x = tmp2[0];
        pt_random.y = tmp2[1];
        pt_random.z = h;
        map_cloud_.push_back(pt_random);
      }
    }
  }

  map_cloud_.width = map_cloud_.points.size();
  map_cloud_.height = 1;
  map_cloud_.is_dense = true;
  pcl::toROSMsg(map_cloud_, map_msg_);
  map_msg_.header.frame_id = "world";
  all_map_pub_.publish(map_msg_);
}

void clickPoseCallback(const geometry_msgs::PoseWithCovarianceStamped& msg) {
  pcl::PointXYZ pt_random;
  for (double x = MIN_X; x <= MAX_X; x += RESO) {
    for (double y = MIN_Y; y <= MAX_Y; y += RESO) {
      pt_random.x = x;
      pt_random.y = y;
      pt_random.z = MIN_HEIGHT;
      map_cloud_.push_back(pt_random);
    }
  }

  map_cloud_.width = map_cloud_.points.size();
  map_cloud_.height = 1;
  map_cloud_.is_dense = true;
  pcl::toROSMsg(map_cloud_, map_msg_);
  map_msg_.header.frame_id = "world";
  all_map_pub_.publish(map_msg_);
}

int main(int argc, char** argv) {
  ros::init(argc, argv, "click_map");
  ros::NodeHandle n("~");

  n.param("map/len2", len2_, 0.15);

  all_map_pub_ =
      n.advertise<sensor_msgs::PointCloud2>("/map_generator/click_map", 1);

  click_sub_ = n.subscribe("/goal", 10, clickCallback);
  click_pose_sub_ = n.subscribe("/initialpose", 10, clickPoseCallback);

  ros::Duration(0.5).sleep();

  // init random device
  while (ros::ok()) {
    pcl::toROSMsg(map_cloud_, map_msg_);
    map_msg_.header.frame_id = "world";
    all_map_pub_.publish(map_msg_);

    ros::spinOnce();
    ros::Duration(1.0).sleep();
  }
}
