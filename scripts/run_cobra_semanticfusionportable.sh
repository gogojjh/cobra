# RVIZ
rviz -d cobra/rviz_cfg/cobra_fusionportable.rviz

# Publish camera info (optional)
rosrun cobra_tools publish_sensor_info /Titan/dataset/FusionPortable_dataset/calibration_files/xxxx_calib/calib &

# Run pointcloud_to_image
roslaunch pointcloud_image_converter pc2img_semanticfusionportable_1024.launch &

# Run cobra-state-estimation
roslaunch r3live r3live_bag_ouster128_time_offline.launch pc2img:=false &

# Run cobra-mapping
roslaunch nvblox_ros nvblox_lidar_ros_semanticfusionportable.launch &


