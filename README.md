<div align="center">
  <!--<a href="">
    <img align="left" src="docs/media/IADC_logo.png" height="100" alt="IADC">
  </a>-->
  <a href="">
    <img align="center" src="docs/media/cobra_logo.png" height="130" alt="cobra">
  </a> 
  <!-- <a href="">
    <img align="" src="docs/media/hkustgz_logo.png" height="80" alt="hkustgz">
  </a>   -->
  <!-- <a href="">
    <img align="right" src="docs/media/hkust_only_pattern.png" height="100" alt="hkustgz">
  </a> -->
</div>

<!--
# Cobra

Cobra is a C++/Python library for metric-semantic-driven navigation in both unstructured and structured environments for mobile robots. 
Cobra is modular, ROS-enabled, and runs on CPU+GPU.

Cobra comprises four **modules**:
- A fast and accurate LiDAR-Vision-Inertial Odometry (LVIO) ([Cobra-State-Estimation](http://gitlab.ram-lab.com/ramlab_dataset_sensor/code/r3live))
- A semantic segmentation (perception) module (high-performance) ([Cobra-Semantics](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/hkustgz_segnet))
- A metric-semantic dense mapping system ([Cobra-Mapping](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/nvblox)) 
  and its ROS-enabled plugins ([Cobra-ROS-Mapping](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/glimpse_nvblox_ros1))
- A metric-semantic global planner ([Cobra-Planner](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/cobra_planner))
- A solver for trajectory optimization (local planner) and control ([TBC](xxx))
- Tool functions:
  - A toolbox to support the debug and monitor of Cobra ([Cobra-Tool](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/cobra_tools))
  - A tool to convert LiDAR points into depth/height images ([Cobra-Tool-p2img](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/pointcloud_image_converter))

Click on the following links to install Cobra's modules and get started! 
It is very easy to install!
-->

#### Overall Results of Cobra

HKUST(GZ)
```
roslaunch r3live r3live_bag_ouster128_raw.launch use_vio:=false play_bag_rate:=1.0 play_bag_start:=0
roslaunch nvblox_ros nvblox_lidar_ros_fusionportable.launch
```
<div align="center">
    <a href="">
      <img src="docs/media/r3live_nvblox_Mapping.gif" width="60%" 
      alt="r3live_nvblox_Mapping">
   </a>
</div>

SemanticKITTI Sequence07 (LiDAR-based semantics)
```
rosbag play semantickitti_sequence07.bag
roslaunch nvblox_ros nvblox_lidar_ros_kitti.launch
```
<div align="center">
    <a href="">
      <img src="docs/media/nvblox_mesh_semantickitti07.gif" width="60%" 
      alt="nvblox_mesh_semantickitti07">
   </a>   
</div>

KITTI-360 (Image-based semantics) (TBC)
```
rosbag play semantickitti_sequence07.bag
roslaunch nvblox_ros nvblox_lidar_ros_kitti.launch
```

<!-- ### [R3LIVE-LVIO](http://gitlab.ram-lab.com/ramlab_dataset_sensor/code/r3live) -->

<!-- <div align="center">
    <a href="http://gitlab.ram-lab.com/ramlab_dataset_sensor/code/r3live">
      <img src="docs/media/r3live_SLAM.gif" alt="R3LIVE-LVIO">
   </a>
</div> -->

## Chart

<!-- ![overall_chart]() -->

<!--
## 1. Installation
We provide the [DockerFile](docker/Dockerfile_x86) or the compiled docker image:
```
docker pull iidcramlab/cobra_x86:20230209-ros_noetic-py3-torch-cuda11.4
nvidia-docker run -e DISPLAY -v ~/.Xauthority:/root/.Xauthority:rw --network host \
  -v /tmp/.X11-unix:/tmp/.X11-unix:rw \
  -v /home/jjiao/mapping_ws/src:/Titan/code/mapping_ws/src \
  -v /Titan/dataset:/Titan/dataset \
  -v /Spy/dataset:/Spy/dataset \
  --privileged --cap-add sys_ptrace \
  -it --name cobra iidcramlab/cobra_x86:20230209-ros_noetic-py3-torch-cuda11.4 \
  /bin/bash
```
Please follow the below tutorial to install individual packages
* [Cobra-State-Estimation](http://gitlab.ram-lab.com/ramlab_dataset_sensor/code/r3live)
* [Cobra-Semantics](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/hkustgz_segnet)
* [Cobra-Mapping](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/nvblox)
* [Cobra-Planner](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/cobra_planner)
* [Cobra-Tool](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/cobra_tools)
* [Cobra-Tool-p2img](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/pointcloud_image_converter)

## 2. Usage
Test with the **FusionPortable** Dataset
```
bash scripts/run_cobra_fusionportable.sh
```

Test with the **SemanticKITTI** Dataset
```
bash scripts/run_cobra_semantickitti.sh
```
-->

## Citation

If you found any of the above modules useful, we would really appreciate if you could cite our work:

- [1] Jiao, J., Wei, H., Hu, T., Hu, X., Zhu, Y., He, Z., ... & Liu, M. [**FusionPortable: A Multi-Sensor Campus-Scene Dataset for Evaluation of Localization and Mapping Accuracy on Diverse Platforms**](https://arxiv.org/abs/2208.11865). In 2022 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS). IEEE.

```bibtex
@inproceedings{jiao2022fusionportable,
  title={FusionPortable: A Multi-Sensor Campus-Scene Dataset for Evaluation of Localization and Mapping Accuracy on Diverse Platforms},
  author={Jiao, Jianhao and Wei, Hexiang and Hu, Tianshuai and Hu, Xiangcheng and Zhu, Yilong and He, Zhijian and Wu, Jin and Yu, Jingwen and Xie, Xupeng and Huang, Huaiyang and others},
  booktitle={2022 IEEE/RSJ International Conference on Intelligent Robots and Systems (IROS)},
  pages={3851--3856},
  year={2022},
  organization={IEEE}
}
```

<!--
## Open-Source Datasets

We release an open-source dataset: [FusionPortable](https://ram-lab.com/file/site/fusionportable/dataset/fusionportable) [1] for real-life tests. 
The dataset provides:
- 3D LiDAR
- Stereo Frame Cameras
- Stereo Event Cameras
- IMU data
- Ground-Truth Odometry
- (Optional: Ground-truth 2D Semantic Segmentation))
- (Optional: TF (ground-truth odometry of robots, and agents))
- (Optional: Static TF (ground-truth poses of static objects))
-->

## Acknowledgments

## License

[BSD License](LICENSE.BSD)
