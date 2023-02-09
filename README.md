<div align="center">
  <a href="">
    <img align="left" src="docs/media/IADC_logo.png" height="100" alt="IADC">
  </a>
  <a href="">
    <img align="center" src="docs/media/cobra_logo.png" height="130" alt="cobra">
  </a>
  <!-- <a href="">
    <img align="" src="docs/media/hkustgz_logo.png" height="80" alt="hkustgz">
  </a>   -->
  <a href="">
    <img align="right" src="docs/media/hkust_only_pattern.png" height="100" alt="hkustgz">
  </a>    
</div>

# Cobra

Cobra is a C++/Python library for metric-semantic-driven navigation in both unstructured and structured environments for mobile robots. 
Cobra is modular, ROS-enabled, and runs on CPU+GPU.

Cobra comprises xxx **modules**:
- A fast and accurate LiDAR-Vision-Inertial Odometry (LVIO) pipeline ([Cobra-State-Estimation](http://gitlab.ram-lab.com/ramlab_dataset_sensor/code/r3live))
- A semantic segmentation (perception) module (high-performance) ([Cobra-Semantics](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/hkustgz_segnet))
- A metric-semantic dense mapping system ([Cobra-Mapping](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/nvblox))
- A metric-semantic global and local planar ([Cobra-Planar](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/cobra_planner))
- Tool functions:
  - A tool to support ROS-enabled NvBLOX ([Cobra-Tool-ros-nvblox](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/glimpse_nvblox_ros1))
  - A tool to convert LiDAR points into depth/height images ([Cobra-Tool-p2img](http://gitlab.ram-lab.com/ramlab_dataset_sensor/mapping_codebase/pointcloud_image_converter))

Click on the following links to install Cobra's modules and get started! 
It is very easy to install!

### [R3LIVE-LVIO](http://gitlab.ram-lab.com/ramlab_dataset_sensor/code/r3live)

<div align="center">
    <a href="http://gitlab.ram-lab.com/ramlab_dataset_sensor/code/r3live">
      <img src="docs/media/r3live_SLAM.gif" alt="R3LIVE-LVIO">
   </a>
</div>

### Chart

<!-- ![overall_chart]() -->

### Install
```
docker pull iidcramlab/cobra_x86:20230209-ros_noetic-py3-torch-cuda11.4
```

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

## Acknowledgments

## License

[BSD License](LICENSE.BSD)
