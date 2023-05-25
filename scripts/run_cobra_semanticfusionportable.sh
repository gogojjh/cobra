############## Online deployment
# RVIZ
rviz -d cobra/rviz_cfg/cobra_fusionportable.rviz

# (Not used) Publish camera info (optional)
# rosrun cobra_tools publish_sensor_info /Titan/dataset/FusionPortable_dataset/calibration_files/xxxx_calib/calib &

# RUN cobra-state-estimation
roslaunch r3live r3live_bag_ouster128_time_offline.launch pc2img:=false &

# RUN cobra-mapping
roslaunch nvblox_ros nvblox_lidar_ros_semanticfusionportable.launch &

############## Offline deployment
rviz -d cobra/rviz_cfg/cobra_fusionportable.rviz

### Step 1
# RUN cobra-state-estimation
roslaunch r3live r3live_bag_ouster128_time_offline.launch \
  use_vio:=true play_bag_rate:=1.0 play_bag_start:=0 \
  pc2img:=false \
  bag_folder:=/Spy/dataset/FusionPortable_dataset/sensor_data/mini_hercules/20230403_hkustgz_vegetation_sequence00 \
  bag_file:=20230403_hkustgz_vegetation_sequence00.bag

# RUN cobra-semantic-segmentation
roslaunch segnet_ros segnet_ros.launch

rosrun cobra_tools publish_lidar_camera_alignment

# RECORD rosbag
rosbag record -O $1/r3live_semantics_framecam00.bag \
  /r3live/camera_odom /r3live/camera_path \
  /r3live/aft_mapped_to_init /r3live/path \
  /r3live/cloud_nonregistered_raw \
  /r3live/render_pts /r3live/rectified_img/compressed \
  /stereo/frame_left/semantic_image \
  /stereo/frame_left/semantic_rgb_image \
  /stereo/frame_left/semantic_uct_image \
  /stereo/frame_left/camera_info /stereo/frame_left/image_chunk_data \
  /tf /tf_static \
  /aligned_semantic_points

### Step 2
# RUN cobra-semantic-mapping
roslaunch nvblox_ros $LAUNCH_NAME \
  bag_file:=$ROSBAG_PATH \
  tsdf_voxel_update_method:="5" \
  voxel_size:="0.25" \
  play_bag_rate:="4.0"

