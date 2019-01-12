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

* we will create teh same code in C++
* C++ code is written in teh <package_folder>/src folder 'catkin_ws/src/my_robot_tutorials/src'
* we name our sourcecode file 'my_first_node.cpp' and edit it
* we include the ros cpp lib `#include <ros/ros.h>`
* we create the main 
```
int main(int argc, char **argv) {
}
```
* we init the node giving it a unique name `ros::init(argc,argv,"my_first_cpp_node");`
* for c++ nodes we need a node handle to be able to start the node `ros::NodeHandle nh;`
* we add a log entry `ROS_INFO("Node has been started");`
* in ROS c++ lib there is no sleep method
* we need to create a duration object and call the sleep method on it `ros::Duration(1.0).sleep();`
* cpp files need to be compile before being executed.
* we go up one folder (into package folder) and edit the CMakeList.txt
* in the '## Declare a C++ executable' section we add `add_executable(node_cpp src/my_first_node.cpp)` passing in the name we want to give to the executable and the source file to use
* executable name is not bound to node name restrictions
* we also need to specify the libraries to link `target_link_libraries(node_cpp ${catkin_LIBRARIES})`
* we save the file and go up to catkin workspace folder and run `catkin_make` to build the node into an executable
* our executable is located into <catkin workspace>/devel/lib/<package name>/ `catkin_ws/devel/lib/my_robot_tutorials/node_cpp` as node_cpp (the name we speced)
* with roscore running we run `./node_cpp` and run our node
* we will now impleemnta a 10Hz loop to printout a log like in python
```
	ros::Rate rate(10);

	while(ros::ok()){
		ROS_INFO("Hello");
		rate.sleep();
	}
```
* we build and run it. it OK
* we run both node (cpp and python) and list them with `rosnode list`.

### Lecture 17 - Debug our Nodes with Command Line Tools

* starting our nodes individually is not practical.
* we can run from anywhere `rosrun <package name> <node_executable or script>` 
* make sure to `source ~/<path>/cat_ws/devel/setup.bash` or add it to the .bashrc
* to see the nodes in the package we run `rosrun <packagename>` and hit TAB 2x times
* once our node is running we can run `rosnode list` to see it in the list (it node name)
* we can grab the /<node name> and run `rosnode info /<node name>` to see info about the node. of course if we know the node name we dont need list.
* what we get is
```
Node [/my_first_python_node]
Publications: 
 * /rosout [rosgraph_msgs/Log]

Subscriptions: None

Services: 
 * /my_first_python_node/get_loggers
 * /my_first_python_node/set_logger_level


contacting node http://ros-vm:32813/ ...
Pid: 4564
Connections:
 * topic: /rosout
    * to: /rosout
    * direction: outbound
    * transport: TCPROS

```
* we see the node published to /rosout node using the Log functionality
* we see the services of the node
* and the connections of the node
* instead od ctrl+c from terminal we can kill a node from anywher with `rosnode kill /<node name>`
* we can ping a running node with `rosnode ping /<node name>`
```
rosnode: node is [/my_first_python_node]
pinging /my_first_python_node with a timeout of 3.0s
xmlrpc reply from http://ros-vm:45621/	time=1.051903ms
xmlrpc reply from http://ros-vm:45621/	time=1.616955ms
...
```

### Lecture 18 - Visualize the ROS Graph with rqt_graph

* we can use a graphical tools to show the current ROS graph
* we run the built in rqt_graph node in the rqt_graph package `rosrun rqt_graph rqt_graph`
* we get a qt window.
* if we unselect debug  we see the graph but it has only the qt node (elipse) publishing to rosout topic (rectangle) and ultimately talking to rosout node (elipse) 
* if we now list the nodes we will wee a new node /rqt_gui_py_node_XXXX
* if we run one of our nodes and hit refresh on the graph tool we will see the ode in isolation (if we have debug selected) if we unselect debug we will see also our node publishing to the rosout topic

### Lecture 19 - Experimenting on Nodes with Turtlesim

* apart from writing our one nodes and packages we can resue a lot of existing ones.
* a way to understand better nodes is to run and see the code of existing ones.
* turtlesim package is a package made for learning ROS
* we install it with `sudo apt-get install ros-melodic-turtlesim`
* we restart the ros master
* we run `rosrun turtlesim` + 2x TAB to see the nodes available
* we have:
	* draw_square
	* mimic
	* turtlesim_node
	* turtle_teleop_key
* we run `rosrun turtlesim turtlesim_node` and get a window with a turtle
* we have a turtlesim node with a GUI window
* we start another node from the same package `rosrun turtlesim turtle_teleop_key` where we can control the turtle from the keys of keyboard
* we launch the graph and see how the nodes are connected

## Section 4 - Communicate with ROS Topics

### Lecture 22 - What is a Topic?

* A Topic is broadcasted by a Publisher Node. muchlike a radio station broacasting in a certain freq.
* Any Node that wants to consume data of this Topic must subscribe to this topic (Subscriber Node)
* Both Subscriber and Publisher must send data with the same structure
* A Topic can have many publishers and many subscribers
* A subscriber or publisher is agnostic of other nodes publishing or subscribing to the topic
* a node can publish, subsribe or publish and subscribe to many different topics
* ROS Topic:
	* A topic is a named bus over which nodes exchange messages 

* topic name MUST NOT start with . or number
* Messages are sent over TCPIP
* ROS libs we use for Topics give enogh abstraction from the inner details
* We use the Topic when we want to establish a unidirectional data stream between the publisher and teh subscriber
* Participating nodes are Anonymous
* A Topic has a message type
* Both C++ and python libs support Topic functionality
* ROS master hhelps nodes find needed topics (like a DNS host)
* A node can have many publishers/subscribers for many different topics

### Lecture 23 - Create a Python Publisher

* we go in our package in scripts folder 'catkin_ws/src/my_robot_tutorials/scripts'
* we ll create anew node py script `touch robot_news_radio_transmitter.py` and make it executable
* we add the boilerplate code and init/name the node
```
#!/usr/bin/env python

import rospy

if __name__ == '__main__':
	respy.init_node('robot_news_radio_transmitter')
```
* to publish sthing on a topic we create a publisher object passing in the name of the topic, the message type and the buffer size `pub = rospy.Publisher('/robot_news_radio', String, queue_size=10)`
* we use a built in msg type of the lib std_msgs we added as dependecy when we created  our package. we import this type in  our script `from std_msgs.msg import String`
* buffer size gives time to subscribers to consume the data when there are many messages pblished
* with publsher ready we can publish data
* we use the rate + while loop patternt to create a periodic loop ofr publishing an in it we create a String message and publish it
```
	rate = rospy.Rate(2)

	while not rospy.is_shutdown():
		msg = String()
		msg.data = 'Hi,this is Sakis from Robot News Radio!'
		pub.publish(msg)
		rate.sleep()
```
* we run with rosrun . with rosnode info we can see the topic in publications
* with the node running and publishing the topic we run `rostopic list` and see the active topics in the ROS. we see our/robot_news_radio listed
* with `rostopic info /robot_news_radio` we see
```
Type: std_msgs/String

Publishers: 
 * /robot_news_radio_transmitter (http://ros-vm:46083/)

Subscribers: None
```
* we can listen to the topic from the terminal with `rostopic echo /robot_news_radio`

### Lecture 24 - Create a Python Subscriber

* 