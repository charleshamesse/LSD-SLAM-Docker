# LSD-SLAM-Docker

This is an implementation of a Docker image to use LSD-SLAM in its official implementation. 
```
git clone https://github.com/tum-vision/lsd_slam lsd_slam
docker build -t lsdslam:latest .
docker compose up
docker exec -it lsd_slam_node bash
```
Then, in the container:
```
rosrun lsd_slam_core live_slam /image:=/k4a/rgb/image_raw _calib:=k4a.cfg
```
