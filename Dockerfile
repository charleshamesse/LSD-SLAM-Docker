# Use the official ROS Noetic (ROS1) base image
FROM osrf/ros:indigo-desktop-full

# Set the working directory
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    python-rosinstall \
    ros-indigo-libg2o  \
    ros-indigo-cv-bridge  \
    liblapack-dev  \
    libblas-dev  \
    freeglut3-dev  \
    libqglviewer-dev  \
    libsuitesparse-dev  \
    libx11-dev ros-indigo-rosmake \
    && apt-get clean

RUN mkdir /app/rosbuild_ws && \
    cd /app/rosbuild_ws && \
    rosws init . /opt/ros/indigo && \
    mkdir package_dir && rosws set /app/rosbuild_ws/package_dir -t . -y && \
    echo ". /app/rosbuild_ws/setup.bash" >> /app/.bashrc


COPY lsd_slam /app/rosbuild_ws/package_dir/lsd_slam

RUN /bin/bash -c "source /app/rosbuild_ws/setup.bash && cd /app/rosbuild_ws/package_dir && rosmake lsd_slam"

CMD ["/bin/bash"]
