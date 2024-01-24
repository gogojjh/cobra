# Publish camera info
rosrun cobra_tools publish_sensor_info /Titan/dataset/FusionPortable_dataset/calibration_files/20220209_calib/calib

# Run pointcloud_to_image
roslaunch pointcloud_image_converter pc2img_fusionportable.launch &

# Run cobra-mapping
rviz -d cobra/rviz_cfg/cobra_fusionportable.rviz
roslaunch nvblox_ros nvblox_lidar_ros_fusionportable.launch &

# Run cobra-state-estimation
roslaunch r3live r3live_bag_ouster128_time_offline.launch 

# RECORD rosbag (record_r3live_semantics_framecam00.sh)
rosbag record -O $1/r3live_semantics_framecam00.bag \
  /r3live/camera_odom /r3live/camera_path \
  /r3live/aft_mapped_to_init /r3live/path \
  /r3live/rectified_img \
  /r3live/cloud_nonregistered_raw /r3live/cloud_registered_raw \
  /r3live/render_pts \
  /tf


