# Udemy Course: ROS For Beginners

* [Course Link](https://www.udemy.com/ros-for-beginners/)
* [Course Repo]()

## Section 1 - Introduction

### Lecture 1 - Welcome

* We will learn how to create build and use:
	* Nodes
	* Topics
	* Services
	* Msg and Srv
	* Parameters
	* Launch Files

### Lecture 2 - What is ROS, When to use it, and Why?

* ROS is a Robot Operating System. It is something between a middleware and a framework for building Robbotic Applications (Drones,Robotic Arms, Autonomous machines)
* ROS goals:
	* Provide a standard for robotic application
	* Use on any robot
* We need to master the basics and core functionalities and then the implement
* Code is reusable.
* In robotics many devs write low level code that already exists
* ROS provides off the shelf core functionalities and basic components . we can focus on high level functionality and apps
* When to use it? when the level of integration we want to achieve (Integrate more and more sensors, actuators and controllers) makes our life difficult using a custom code
* ROS applications are scalable and powerful
* ROS can be used when we want to rwrite robot software that needs a lot of communication between its subprograms, or if it has functionalities that go far beyond
* It shones for complex applications and complex Robot apps
* ROS provides a way to separate the code in reusable blocks offering communication tools to easily communicate between all our subprograms
* For example if we program a robotic arm we can:
	* create a subprogram (node) for our camera
	* another node for motion planning
	* another node for HW driver
	* another node for joystick
* each of these independent blocks will communicate in a powerful and scalable way using ROS communication tools
* ROS provides:
	* code separation and communication tools
	* plug & play libraries
* E.g there are libraries to compute inverse kinematic, plan a trajectory, avoid obstacles etc
* ROS is language agnostic. we can program parts in python , parts in C++
* ROS is open source with an active community

### Lecture 3 - How to get the most out of this course

* write the code, don't just read
* experiment with the tools
* do the activities

## Section 2 - Install ROS and Setup Your Environment

### Lecture 4 - Intro

* we will install it on ubuntu 16.04 (so kinetic) we can makje a vm with ubuntu 18.04 to instal melodic

### Lecture 6 - Which ROS version to use?

* a new release every year
* recommended is melodic
* we opt to use ubuntu 18.04 on a vm from our windows partition.
* we will use virtualbox for our virtual machine
* we name the vm
* we give as much ram as possible (max green for us is 5130MB)
* create virtual disk
* use vdi
* use dynamic allocation
* give it 25gb of space
* in the new VM we click settings
* we give max cpu cores (4)
* in storage in IDE controller we select our iso file
* ok and start
* we install ubuntu => normal installation => in vm we erase dick and install
* we open a terminal and upgrade packages `sudo apt-get update` and `sudo apt-get upgrade`
* we run `sudo apt-get install virtualbox-guest-dkms` to fix resolution and restart
* we run `sudo apt-get install virtualbox-guest-additions-iso` to fix sound and restart
* we download a text editor. we get sublime

### Lecture 8 - Install ROS

* we go to [melodic install](http://wiki.ros.org/melodic/Installation/Ubuntu) and follow the instructions
* we setup our sources list `sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'`
* we setup the keys for package repo `sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116`
* we do update `sudo apt update`
* we install full installation with desktop `sudo apt install ros-melodic-desktop-full`. it takes a lot of time
* to find the newly installed available packages `apt search ros-melodic`
* we initialize rosdep. rosdep eanbles easy install system dependencies
```
sudo rosdep init
rosdep update
```
* ros is now available. before using it we need to setup our environent. this step we need to repeat in every NEW TERMINAL we want to run ROS. we add it to bashrc to avoid the need to source every time
```
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
```
* to install new packages to ros `sudo apt=get install ros-melodic-<packagename>`

### Lecture 9 - Launch Your First ROS Master

* to launch a new ros master we type in terminal `roscore`
* we have a ros master running on our environment
* ROS master is the centerpiece of the ROS application. it provides naming and registration services wo all ROS subprograms (nodes)
* we always ahave to start the ROS master before we use any ROS functionality
* I can have only 1 ROS master running at the same time

## Section 3 - Run your First ROS Program

### Lecture 12 - Create a Catkin Workspace

* In this lecture we will see how to create a Catkin workspace
* Catkin is the official build system for ROS. we use it to build a ROS app
* we will create a new folder 'catkin_ws'. we cd into it and create a 'src' folder
* then beign in the catkin_ws folder we run `catkin_make`
* after build finishes we have a 'devel' and 'build' folders. 
* also in src folder we have 'CMakeLists.txt' this file was created by catkin to init the workspace
* all our code will be in the src/  folder. anytime we want to build our code we go to catkin_ws folder (project root folder) and run `catkin_make`
* last thing we have to do is to source the catkin workspace
* in the devel/ folder we have 'setup.bash' file. being in the devel folder we `source setup.bash` 
* to avoid having to write the command in any new terminal we add the command to .bashrc 
* we `vim ~/.bashrc` in the end of the file we add `/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/setup.bash`
* we run a new terminal. it is now ready for ros and catkin workspace

### Lecture 13 - Create a ROS Package

* to run code with ROS we have to create packages.
* packages allow to separate our code into reusable blocks
* the package is an independent unit (one package for camera, one package for hw control one ofr motion palnning in the env)
* we will create a simple package
* to create a package we go to srs/ in our workspace. in there we run `catkin_create_pkg <name> <dependencies>` e.g in our case `catkin_create_pkg my_robot_tutorials roscpp std_msgs` rocpp = ros c++ libs rospy = ros python lib, std_msgs = ????
* now we have anew folder ins src/ named my_robot_tutorials/
* this folder contains a src/ folder an include/ folder a package.xml and CMakeLists.txt
* CMakeLists.txt has a lot of examples. also package.xml has the depndencies and configuration
* if we now go to project parent dir catkin_ws/ and run `catkin_make` we see that the new package is built with catkin

### Lecture 14 - What is a Node?

* A ROS Node os a process that performs computations
* Much like an executable program that runs in our robot application
* Our App will contain many nodes grouped into packages
* Nodes can communicate with each other
* e.g In our Sample App the Camera Pkg will handle the camera as an independent unit, TO do its job it will contain: A Camera driver, an image Processing program etc. all these blocks are Nodes.
* Each node is launched separately
* Nodes will communicate using ROS communication functionality
* The decision on which package to put a node has to do with app architecture
* In the sample apps Motion Planning Package we can expect to have a motion planning node (it will perform motion planning for any given robot). We can also have a Path Correction Node to correct Motion Planning using external factors.
* What we have to think of is how to make two nodes from different packages communicate with each other. E.g the imaghe processing node will analyze the images and send the analysis to the path correction node to calculate correction. this node then will notify the motion planning node for the adjustments it has to make
* In HW Control Pkg we will find nodes that control the HW of the robot (weels, robotic arm joints etc). These nodes can be: Main Control Loop Node, HW Drivers Node, State Publisher Node
* E.g the position coming from teh motor encoders is sent back to the control loop ofr precise control and is published in the State Publisher Node
* The Motion Planning Node will send computed trajectories to teh Main Control Loop to execute them
* State from State Publisher is sent to the Path Correction and the motion Planning Node
* ROS Nodes (in a nutshell):
	* Processes that perform Computations
	* Combined into a graph
	* Comminicate with each other through topics, services, parameter server
* ROS Nodes benefits:
	* Reduce code complexity
	* Fault tolerance (1 can crash, the others will run)
	* Can be written in C++, Python, ...
* Nodes must have unique names

### Lecture 15 - Our first Python Node

* we go to our package folder in our workspace 'catkin_ws/src/my_robot_tutorials'
* we create a scripts folder `mkdir scripts` and cd into it
* we add a python script file and make it executable
```
touch my_first_node.py
chmod +x my_first_node.py
```
* we start to code it
* we set the env to python `#!/usr/bin/env python`
* we import rospy `import rospy` that we added as a dependency in the package
* first of all we have to initialize the node giving it a (unique) name
```
if __name__ == '__main__':
	rospy.init_node('my_first_python_node')
```
* after we initialize we create some log trace for ros `rospy.loginfo("This node has been initialized")`
* we send rospy to sleep for 1 second `rospy.sleep(1)`
* then add one more log entry `rospy.loginfo("Exit now")`
* we save the file and run it as a python script `python my_first_node.py ` but get an error 'Unable to register with master node [http://localhost:11311]: master may not be running yet. Will keep trying.'
* this is becase we always need to run the master with `roscore` before running anything related to ros
* we start it and we see our node executing (see the logs in term)
* we will add more functionality in our node
* we use `rate = rospy.Rate(10)` to set a rate (a timer) with a freq of 10Hz
* we also use a while loop with condition rospy.is_shutdown() which is False as long as our node is running `while not rospy.is_shutdown():`
* we shutdown the node with ctrl+C or programmaticaly
* we log and then use rate.sleep() to sleep from 1/10 of sec.
```
	while not rospy.is_shutdown():
		rospy.loginfo('Hello')
		rate.sleep()
```
* what effectively we implemented was a 10Hz  loop cycle to run our code
* to see our currenlty running nodes we use `rosnode list` in our example we see our node and 'rosout' which is always running (logging and other functionality)
* if i attmpe to run the script/node 2 times one is shutdown (nodes must be unique named)

### Lecture 16 - Our first C++ node

* 