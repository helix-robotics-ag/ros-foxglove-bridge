ARG ROS_DISTRO=iron

FROM ros:${ROS_DISTRO}-ros-core

RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-${ROS_DISTRO}-foxglove-bridge \
    ros-${ROS_DISTRO}-tf2-msgs \
    ros-${ROS_DISTRO}-rosapi-msgs \
    ros-${ROS_DISTRO}-geometry-msgs \
    ros-${ROS_DISTRO}-sensor-msgs \
    ros-${ROS_DISTRO}-rosbridge-msgs \
    && rm -rf /var/lib/apt/lists/*

COPY ros_entrypoint.sh .

RUN echo 'source /opt/ros/iron/setup.bash; ros2 launch foxglove_bridge foxglove_bridge_launch.xml' >> /run.sh && chmod +x /run.sh
RUN echo 'alias run="su - ros /run.sh"' >> /etc/bash.bashrc
