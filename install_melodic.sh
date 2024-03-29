sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'

sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654

sudo apt update


sudo apt install ros-melodic-desktop-full

sudo rosdep init

rosdep update

if [ $SHELL = "/usr/bin/zsh" ]
then
	echo "source /opt/ros/melodic/setup.zsh" >> ~/.zshrc
	source ~/.zshrc
elif [ $SHELL = "/bin/bash" ]
then
	echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
	source ~/.bashrc

else 
	echo "ERROR : SHELL ENVIRONMENT NOT SUPPORTED (ZSH and BASH only !!)"
fi

sudo apt install python-rosinstall python-rosinstall-generator python-wstool build-essential

if [ $SHELL = "/usr/bin/zsh" ]
then
	source ~/.zshrc
elif [ $SHELL = "/bin/bash" ]
then
	source ~/.bashrc

else 
	echo "ERROR"
fi

mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_make

if [ $SHELL = "/usr/bin/zsh" ]
then
	echo "source ~/catkin_ws/devel/setup.zsh" >> ~/.zshrc
elif [ $SHELL = "/bin/bash" ]
then
	echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

else 
	echo "ERROR : SHELL ENVIRONMENT NOT SUPPORTED (ZSH and BASH only !!)"
fi

echo $ROS_PACKAGE_PATH

telnet towel.blinkenlights.nl
