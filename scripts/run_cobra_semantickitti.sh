# Run pointcloud_to_image
roslaunch pointcloud_image_converter pc2img_semantickitti.launch &

# Run cobra-mapping
rviz -d cobra/rviz_cfg/cobra_semantickitti.rviz
roslaunch nvblox_ros nvblox_lidar_ros_semantickitti.launch &

# Run the Rosbag
rosbag play semantickitti_sequence07.bag

