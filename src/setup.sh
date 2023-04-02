#!/bin/bash
#install ros noetic
cd ~
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt install curl
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
sudo apt update
sudo apt install ros-noetic-desktop-full
echo "source ~/slam_laptop/devel/setup.bash" >> ~/.bashrc
echo "source /opt/ros/noetic/setup.bash" >> ~/.bashrc
echo "export ROS_MASTER_URI=http://172.20.10.7:11311" >> ~/.bashrc
echo "export ROS_HOSTNAME=172.20.10.6" >> ~/.bashrc
cd ~/slam_laptop/src
git clone https://github.com/robopeak/rplidar_ros.git
cd rplidar_ros
git checkout slam
#install hector slam
cd ~/slam_laptop
sudo apt-get install ros-noetic-hector-slam
catkin_make
echo "source ~/slam_laptop/devel/setup.bash" >> launch.sh
echo "roslaunch rplidar_ros view_slam.launch" >> launch.sh
