# Run pointcloud_to_image
roslaunch pointcloud_image_converter pc2img_fusionportable.launch &

# Run cobra-mapping
rviz -d cobra/rviz_cfg/cobra_fusionportable.rviz
roslaunch nvblox_ros nvblox_lidar_ros_fusionportable.launch &

# Run cobra-state-estimation
roslaunch r3live r3live_bag_ouster128_raw.launch 

