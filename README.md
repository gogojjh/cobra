<!-- <div align="center">
  <a href="http://mit.edu/sparklab/">
    <img align="left" src="docs/media/sparklab_logo.png" width="80" alt="sparklab">
  </a>
  <a href="https://www.mit.edu/~arosinol/">
    <img align="center" src="docs/media/kimeravio_logo.png" width="150" alt="kimera">
  </a>
  <a href="https://mit.edu">
    <img align="right" src="docs/media/mit.png" width="100" alt="mit">
  </a>
</div> -->

<div align="center">
  <a href="">
    <img align="center" src="docs/media/cobra_logo.png" width="150" alt="">
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

<!-- <p align="center">
    <a href="https://www.youtube.com/watch?v=-5XxXRABXJs">
    <img src="docs/media/kimera_thumbnail.png" alt="Kimera">
    </a>
</p> -->

<!-- Click on the following links to install Kimera's modules and get started! It is very easy to install! -->

<!-- ### [Kimera-VIO & Kimera-Mesher](https://github.com/MIT-SPARK/Kimera-VIO) -->

<!-- <div align="center">
    <a href="https://github.com/MIT-SPARK/Kimera-VIO">
      <img src="docs/media/kimeravio_ROS_mesh.gif" alt="Kimera-VIO">
   </a>
</div> -->

### Chart

<!-- ![overall_chart]() -->

## Citation

If you found any of the above modules useful, we would really appreciate if you could cite our work:

<!-- - [1] A. Rosinol, T. Sattler, M. Pollefeys, L. Carlone. [**Incremental Visual-Inertial 3D Mesh Generation with Structural Regularities**](https://arxiv.org/abs/1903.01067). IEEE Int. Conf. on Robotics and Automation (ICRA), 2019. [arXiv:1903.01067](https://arxiv.org/abs/1903.01067)

```bibtex
@InProceedings{Rosinol19icra-incremental,
  title = {Incremental visual-inertial 3d mesh generation with structural regularities},
  author = {Rosinol, Antoni and Sattler, Torsten and Pollefeys, Marc and Carlone, Luca},
  year = {2019},
  booktitle = {2019 International Conference on Robotics and Automation (ICRA)},
  pdf = {https://arxiv.org/pdf/1903.01067.pdf}
}
``` -->

## Open-Source Datasets

<!-- In addition to the [real-life tests](http://ci-sparklab.mit.edu:8080/job/MIT-SPARK-Kimera/job/master/VIO_20Euroc_20Performance_20Report/) on the [Euroc](https://projects.asl.ethz.ch/datasets/doku.php?id=kmavvisualinertialdatasets) dataset, we use a photo-realistic Unity-based simulator to test Kimera.
The simulator provides:
- RGB Stereo camera
- Depth camera
- Ground-truth 2D Semantic Segmentation
- IMU data
- Ground-Truth Odometry
- 2D Lidar
- TF (ground-truth odometry of robots, and agents)
- Static TF (ground-truth poses of static objects)

Using this simulator, we created several large visual-inertial datasets which feature scenes with and without dynamic agents (humans), as well as a large variety of environments (indoors and outdoors, small and large).
These are ideal to test your Metric-Semantic SLAM and/or other Spatial-AI systems!

- [uHumans](http://web.mit.edu/sparklab/datasets/uHumans/) (released with [3])
- [uHumans2](http://web.mit.edu/sparklab/datasets/uHumans2/) (released with [4]) -->

## Acknowledgments

## License

[BSD License](LICENSE.BSD)
