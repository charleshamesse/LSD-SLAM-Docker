# LSD-SLAM-Docker

This is a Docker image to use LSD-SLAM using its official codebase, written for ROS Indigo and Ubuntu 14.04. 
```
git clone https://github.com/tum-vision/lsd_slam lsd_slam
docker build -t lsdslam:latest .
docker compose up
docker exec -it lsd_slam_node bash
```
Then, in the container:
```
rosrun lsd_slam_core live_slam /image:=image_topic_calib:=calib_file
```

Refer to the [official repository](https://github.com/tum-vision/lsd_slam) or raise an issue for any question.