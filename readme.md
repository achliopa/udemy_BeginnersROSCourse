# Udemy Courses: ROS For Beginners & ROS Actions

* [Course 1 Link](https://www.udemy.com/ros-for-beginners/)
* [Course 2 Link](https://www.udemy.com/ros-actions/)
* [Course Repo]()

# Course 1: ROS For Beginners

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

* ROS is a Robot Operating System. It is something between a middleware and a framework for building Robotic Applications (Drones,Robotic Arms, Autonomous machines)
* ROS goals:
	* Provide a standard for robotic application
	* Use on any robot
* We need to master the basics and core functionalities and then implement
* Code is reusable.
* In robotics many devs write low level code that already exists
* ROS provides off the shelf core functionalities and basic components . we can focus on high level functionality and apps
* When to use it? when the level of integration we want to achieve (Integrate more and more sensors, actuators and controllers) makes our life difficult using a custom code
* ROS applications are scalable and powerful
* ROS can be used when we want to rwrite robot software that needs a lot of communication between its subprograms, or if it has functionalities that go far beyond
* It shines for complex applications and complex Robot apps
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

* we will install it on ubuntu 16.04 (so kinetic). we can make a vm with ubuntu 18.04 to instal melodic

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
* we install ubuntu => normal installation => in vm we erase disk and install
* we open a terminal and upgrade packages `sudo apt-get update` and `sudo apt-get upgrade`
* we run `sudo apt-get install virtualbox-guest-dkms` to fix resolution and restart
* we run `sudo apt-get install virtualbox-guest-additions-iso` to fix sound and restart
* we download a text editor. we choose sublime

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
* ROS master is the centerpiece of the ROS application. it provides naming and registration services to all ROS subprograms (nodes)
* we always have to start the ROS master before we use any ROS functionality
* I can have only 1 ROS master running at the same time

## Section 3 - Run your First ROS Program

### Lecture 12 - Create a Catkin Workspace

* In this lecture we will see how to create a Catkin workspace
* Catkin is the official build system for ROS. we use it to build a ROS app
* we will create a new folder 'catkin_ws'. we cd into it and create a 'src' folder
* then being in the catkin_ws folder we run `catkin_make`
* after build finishes we have 'devel' and 'build' folders. 
* also in src folder we have 'CMakeLists.txt'. this file was created by catkin to init the workspace
* all our code will be in the src/  folder. anytime we want to build our code we go to catkin_ws folder (project root folder) and run `catkin_make`
* last thing we have to do is to source the catkin workspace
* in the devel/ folder we have 'setup.bash' file. being in the devel folder we `source setup.bash` 
* to avoid having to write the command in any new terminal we add the command to .bashrc 
* we `vim ~/.bashrc` in the end of the file we add `/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/setup.bash`
* we run a new terminal. it is now ready for ros and catkin workspace

### Lecture 13 - Create a ROS Package

* to run code with ROS we have to create packages.
* packages allow to separate our code into reusable blocks
* the package is an independent unit (one package for camera, one package for HW control one for motion planning in the env)
* we will create a simple package
* to create a package we go to src/ in our workspace. in there we run `catkin_create_pkg <name> <dependencies>` e.g in our case `catkin_create_pkg my_robot_tutorials rospy roscpp std_msgs` where rocpp = ros c++ libs rospy = ros python lib, std_msgs = ????
* now we have a new folder in src/ named my_robot_tutorials/
* this folder contains a src/ folder an include/ folder a package.xml and CMakeLists.txt
* CMakeLists.txt has a lot of examples. also package.xml has the depndencies and configuration
* if we now go to project parent dir catkin_ws/ and run `catkin_make` we see that the new package is built with catkin

### Lecture 14 - What is a Node?

* A ROS Node is a process that performs computations
* Much like an executable program that runs in our robot application
* Our App will contain many nodes grouped into packages
* Nodes can communicate with each other
* e.g In our Sample App the Camera Pkg will handle the camera as an independent unit, To do its job it will contain: A Camera driver, an image Processing program etc. all these blocks are Nodes.
* Each node is launched separately
* Nodes will communicate using ROS communication functionality
* The decision on which package to put a node has to do with app architecture
* In the sample apps Motion Planning Package we can expect to have a motion planning node (it will perform motion planning for any given robot). We can also have a Path Correction Node to correct Motion Planning using external factors.
* What we have to think of is how to make two nodes from different packages communicate with each other. E.g the image processing node will analyze the images and send the analysis to the path correction node to calculate correction. this node then will notify the motion planning node for the adjustments it has to make
* In HW Control Pkg we will find nodes that control the HW of the robot (wheels, robotic arm joints etc). These nodes can be: Main Control Loop Node, HW Drivers Node, State Publisher Node
* E.g the position coming from the motor encoders is sent back to the control loop of precise control and is published in the State Publisher Node
* The Motion Planning Node will send computed trajectories to the Main Control Loop to execute them
* State from State Publisher is sent to the Path Correction and the motion Planning Node
* ROS Nodes (in a nutshell):
	* Processes that perform Computations
	* Combined into a graph
	* Communicate with each other through topics, services, parameter server
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
* we will now implementa a 10Hz loop to printout a log like in python
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

* apart from writing our one nodes and packages we can reuse a lot of existing ones.
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

* in our package scripts we add a new file smartphone.py to write our topic suscriber node and make it executable
* we add boilerplate python node code and name it
```
#!/usr/bin/env python
import rospy

if __name__ == '__main__':
	rospy.init_node('smartphone')
```
* we create a subscriber object  `sub = rospy.Subscriber('/robot_news_radio',String, callback_receive_radio_data)` with Subsriber class passing the toipic name , the msg type and a callback method to call when new data arrive
* we also import String from std_msgs.msg
* we create the callback which gets as input the msg
```
def callback_receive_radio_data(msg):
	rospy.loginfo("Message received: ")
	rospy.loginfo(msg)
```
* we add `rospy.spin()` to keep our node alive and listening as we dont have a rate and whileloop
* we rosrun both and visualise them aslo we get rostopic info
```
Type: std_msgs/String

Publishers: 
 * /robot_news_radio_transmitter (http://ros-vm:37101/)

Subscribers: 
 * /smartphone (http://ros-vm:45647/)

```

### Lecture 25 - Create a C++ Publisher and Subscriber

* we will reimplement the radio_news topic publisher and subscriber node with C++.
* in our my_robot_tutorials/src folder we add a 'robot_news_radio_transmitter.cpp' file and edit it
* we add boilerplate code nsming and starting the node
```
#include <ros/ros.h>

int main(int argc, char **argv){
	ros::init(argc,argv,"robot_news_radio_transmitter");
	ros::NodeHandle nh;
}
```
* we create a publisher object  `ros::Publisher pub = nh.advertise<std_msgs::String>( "/robot_news_radio", 10)` using nh.advertise() method which takes the message type as a template. w epass in only the topic name and thje queue size
* we also need to include the lib `#include <std_msg/String.h>`
* we create a Rate fot the loop `ros::Rate rate(2);`
* we crete the nodes process excution loop
```
	while (ros::ok()) {
	}
```
* in the loop we instantiate a msg object and set the data
```
		std_msgs::String msg;
		msg.data = "Hi, this is Lydia from the Robot news Radio"
```
* we publish it using the Publiser publish method `pub,publish(msg);` and sleep `rate.sleep();`
* we need to add the build cofig in CMakeLists.txt in the package folder and add
```
add_executable(robot_news_radio_transmitter src/robot_news_radio_transmitter.cpp)
target_link_libraries(robot_news_radio_transmitter ${catkin_LIBRARIES})
```
* we go up to catkin_ws folder to buils with `catkin_make` and run the node with rosrun
* we also run smartphone.py to listen to the topic
* we ll build our c++ suscriber implementation in <package>/src and call it smartphone.cpp
* we add boilerplate node code
```
#include <ros/ros.h>

int main(int argc, char **argv) {
	ros::init(argc,argv,"smartphone");
	ros::NodeHandle nh;
}
```
* we need to create a SUbscriber `	ros::Subscriber sub = nh.subscribe( "/robot_news_radio", 1000, callback_receive_radio_data);` passing in the topic name tha buffer size and the callback to call when message comes
* we implement the calback. message is passed by reference and to get the data as string we use c_str() method
```
void callback_receive_radio_data(const std_msgs::String& msg){
	ROS_INFO("Message receiveL : %s", msg.data.c_str())
}
```
* to keep the node running and wait for messages we run `ros::spin()`
* we add inCMakiList.txt the node and build it and run both nodes. they comm...

### Lecture 26 - Use Anonymous Nodes to Launch Multiple Publishers/Subscribers

* we have now 2 publishers and 2 subscribers on teh same topic. we can not run them all together due tp naming rules
* we can solve this by naming nodes uniquely. also we can say in the init node that the node is anonymous e.g `rospy.init_node('robot_news_radio_transmitter', anonymous=True)`
* in that case when the node runs a random string is appended to its name
* i can ever rosrun the same build and each running instance node will be uniquely named
* for C++ making node anonymous is done with `ros::init(argc, argv, "robot_news_radio_transmitter", ros::init_options::AnonymousName);`
* in this way if we have multiple sensors (same) we can run the same node implementation multiple times
* of course we can make also subscribers anonymous

### Lecture 27 - Debug Topics with Command Line Tools

* like nodes topics have their command line tools. we ve seen o far 
	* rostopic info <node name>
	* rostopic list 
	* rostopic echo <node name>
* we can so more with `rostopic -h`
```
	rostopic bw	display bandwidth used by topic
	rostopic delay	display delay of topic from timestamp in header
	rostopic echo	print messages to screen
	rostopic find	find topics by type
	rostopic hz	display publishing rate of topic    
	rostopic info	print information about active topic
	rostopic list	list active topics
	rostopic pub	publish data to topic
	rostopic type	print topic or field type
```
* the syntax to publish with rostopic pub is `rostopic pub -1 /robot_news_radio std_msgs/String "data: 'Hello from Pub'"` this will publish one time only. to publish multiple times we use  -r 5 `rostopic pub -r 5 ...` 5 is the rate in Hz

### Lecture 28 - Visualize Topics tith rgt_graph

* as we ve seen we can use rqt_graph to see a graph respresentation of our system

### Lecture 29 - Experiment on Topics with Turtlesim

* i run `rosrun turtlesim turtlesim_node` and rosrun turtlesim turtle_teleop_key
* i can command the turtle with keys
* i use rgt_graph to see the topic they use to comm . its /turtle1/cmd_vel so i `rostopic echo /turtle1/cmd_vel` and snif the dat sent in this topic
* we can manualy publish something in this topic from terminal 
```
  rostopic pub -1 /turtle1/cmd_vel geometry_msgs/Twist "linear: 
  x: 2.0
  y: 0.0
  z: 0.0
angular: 
  x: 0.0
  y: 0.0
  z: 0.0"
```

### Lecture 30 - Topic Activity

* we have to implement
	* a publisher node (number_publisher) that publishes in /number topic (std_msgs/Int64)
	* a subscriber/publisher node (number_counter) that listens to /number topic and publishes to /number_counter topic (std_msgs/Int64) a coutner of the messages he received so far
* to reuse the publisher from callback we make it global

## Section 5 - Communicate with ROS Services

### Lecture 33 - Intro

* Topics are not suitable for all kinds of communication
* if we want to toggle LEDS on the robot we needa client server architecture

### Lecture 34 - What is a Service?

* say we have a LED panel on our robot controlled by a LED panel node.
* we want this node to be accessible from other nodes that want to change the status of the leds.
* we create  ROS service names Set Led
* in the LED panel node we create a service server for the Set LED service.
* LED panel node advertises the Set Led service
* In the robot we have another node dealing with the Battery status (Battery Node)
* The battery Node will contain a Service CLient for the Set Led service
* when battery goes LOW. Battery node will send a request to Set LED service with data (Led Num: 3, state: ON)
* THe service server expects certain data. if data in request are like expected he process the info. once we processes the request he sends back a response (also predefined) e.g Success: True
* server is now ready to accept new requests
* ROS - Services:
	* A ROS Service is a client/server system
	* It is synchronous
	* we should use it only for computations and fast actions
	* service call is blocking so our node will be waiting for reply
	* A service is defined by its name and by 2 message types (request and response)
	* It can be written in Python or C++ in the nodes
	* Only 1 server, many clients

### Lecture 35 - Create a Python Service Server

* we will create a service server that takes 2 numbers in the request and returns their sum as response (computational task)
* in ourr package scripts we create add_two_ints_server.py and make it executable
* we add boilerplate code
* to create a service we use `service = rospy.Service( '/add_two_ints', AddTwoInts, handle_add_two_ints)` where we pass in the name of the service (start witha verb by conv), the request and response message type and the callback the server will run when he gets a request
* the message type is a builtin type from rospy_tutorials
* when server gets a req from a client he checks that the type is valid and then runs the callback where he will send the repsonse back
* we implement the callback where req is passed as arg and we return the response speceke in teh req/res mssg type
```
def handle_add_two_ints(req):
	result = req.a + req.b
	rospy.loginfo("Sum of "+str(req.a)+" and "+str(req.b)+" is "+str(result))
	return result
```
* we log and spinto keep the node (server) alive
* we run it with rosrun
* to test it we use 'rosservice' group of commands
* with `rosservice list` we see our new service and with `rosservice info <servicename>` we see info about it
```
Node: /ad_two_int_server
URI: rosrpc://ros-vm:36797
Type: rospy_tutorials/AddTwoInts
Args: a b
```
* we call the service from command line `rosservice call /add_two_ints 1 2` passing the 2 arguments and get back the sum

### Lecture 36 - Create a Python Service Client

* agin in scripts folder we create a ;py file 'add_two_ints_client.py' and make it executable and edit its
* we add node boilerplate code
* before we start sending requests to teh service we add a wait `rospy.wait_for_service("/add_two_ints")`
* this is a blocking code and waits till the service is avaialble
* we put our client code in a try,except block as if server is not ready we will get an exception.
```
	try:
		add_two_ints = rospy.ServiceProxy("/add_two_ints", AddTwoInts)
		response = add_two_ints(2,6)
		rospy.loginfo("Response is: "+ str(response.sum))
	except rospy.ServiceException as e:
		rospy.logwarn("Service failed: " + str(e))
```
* in the try block we create the client and send teh request printing the response
* we run cliient and waits for server ., we run the server and we see the comm happening

### Lecture 37 - Create a C++ Service Server & Client

* we add two src files 'add_two_ints_server.cpp' and 'add_two_ints_client.cpp' in src folder of package and add their entries in CMakeLists.txt in package folder.
* we start with server. we add boilerplate c++ node code
* we create teh serviceserver `ros::ServiceServer server = nh.advertiseService("/add_two_ints", handle_add_two_ints);` passing in the name and the callback
* we spin to keep alive
* we impleemnt the callback
```
bool handle_add_two_ints(rospy_tutorials::AddTwoInts::Request &req,
						rospy_tutorials::AddTwoInts::Response &res){

	int result = req.a + req.b;
	ROS_INFO("%d + %d = %d", (int)req.a, (int)req.b, (int)result);
	res.sum = result;
	return true;
}
```
* in C++ the callback return a bool whetehr it was successfult or not
* req and res are passed in as references from which we get/set the data
* we ads rospy_tutorials in our package dependencies in CMAKELists
* we add it also in package.xml as buils,buildexport and exec dependency
* we build and run and test with the python client. success!!!
* we implement client
* we add boilerplate node code
* we create the serviceclient `ros::ServiceClient client = nh.serviceClient<rospy_tutorials::AddTwoInts>("/add_two_ints");
}` and include AddTwoInts.h
* we create the service message and fill in ther equest
```
	rospy_tutorials::AddTwoInts srv;
	srv.request.a =12;
	srv.request.b = 23;
```
* we call the service with `client.call(srv);`
* NOTE that so far we have no e rror  handling neither wait
* we add some error shandling logic to lmake sure that we print when we have a repsonse
```
	if (client.call(srv)){
		// process data
		ROS_INFO("Returned sum is %d",(int)srv.response.sum);
	} else {
		ROS_WARN("Service call failed");
	}
```
* we build and test. success

### Lecture 38 - Debug Services with Command Line Tools

* we have seen rosservice info, list, call
* all rosservice commands are
```
	rosservice args	print service arguments
	rosservice call	call the service with the provided args
	rosservice find	find services by service type
	rosservice info	print information about service
	rosservice list	list active services
	rosservice type	print service type
	rosservice uri	print service ROSRPC uri
``` 

### Lecture 39 - Experiment on Services with Turtlesim

* we launch turtlesim_node and turtle_teleop_key form turtlesim
* with both nodes running we see `rosservice list`
* we `rosservice info /reset` is of type std_srvs/Empty that means no arguments. we call it to reset the turtle
* we check turtle1/teleport_relative service. its type is 'turtlesim/TeleportRelative' it takes lienar and angular setpoints as float. we call it.

### Lecture 40 - Service Activity

* in our already implmented number_counter node we will create a service '/reset_number_count' of type std_srvs/SetBool to reset the counter
* we add std_srvs import in package.xml and CMakeLists.xml

## Section 6 - Customize Your Application with Msg and Srv Files

### Lecture 44 - What are Msg and Srv Definitions?

* A Topic is defined by:
	* Name: (e.g /number_count)
	* Msg definition (ex:std_msgs/Int64)

* A Service is defined by:
	* Name (e.g /reset_counter)
	* Srv definitions (ex: std_srvs/SetBool) (one definition for Request Msg and one for Response Msg)

* To use the Msg in our code we need to create a Msg definition inb the Package
* When we build with catkin source code will be generated for any supported lang (by default C++ and Python): 
	* Msg C++ source code
	* Msg Python source code
	* Msg ... source code
* then we can include them as libs in our Node code
* To create msg definitions we can use any of the primitive datatypes listed in [msg doc](http://wiki.ros.org/msg) and also arrays
* we can also create msg definitions using other existing message definitions (from available packages)
	* std_msgs
	* sensor_msgs
	* geometry_msgs
	* ...
* for services we can also build on services from existing packages: e.g std_srvs
* 3rd party message and service definitions can be installed as external packages (we have seen this) by adding them in package.xml and CMakeList.txt for C++ or by imports in Python
* all standard MSg and Srv definitions are well documented in ros.org
* e.g 'geometry_msgs/Twist.msg' has a geometry_msgs/Vector3 dtype (linear) and a geometry_msgs/Vector3 dtype (angular)

* std_srvs has 3 standard service messages (Trigger,SetBool,Empty). Service message documentation is divided by --- (above is the Request message below the Response message)

### Lecture 45 - Create and Build Your Own Custom Msg

* in our catkin_ws/src we will create a new package for our messages
* custom messages can be added in node packages. but is more convenient to put our project messages in a separate reusable package
* we run `catkin_create_pkg my_robot_msgs roscpp rospy std_msgs` as we want access to both libs and to std_msgs to build upon other message types
* we remove the 2 generated folders (include and src) and keep only the CMakeLists.txt and package.xml files
* we first edit the package.xml. a message package needs 2 dependencies additions `  <build_depend>std_msgs</build_depend>` and `  <exec_depend>message_runtime</exec_depend>`
* we now edit the CMakeLists.txt
* in find_package we add 'message_generation'
```
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation
)
```
* we go to 'Declare ROS messages, services and actions' section
* we uncomment the following to be able to include std_msgs in our definitions
```
generate_messages(
  DEPENDENCIES
  std_msgs
)
```
* in 'catkin specidic configuration' section we uncomment `CATKIN_DEPENDS roscpp rospy std_msgs` and add 'message_runtime' in this line
* our package is now ready for messages.
* we add a msg/ folder in package root and add a msg file `touch HardwareStatus.msg`
* we will make the message using primitive datatype and std_msgs types
```
int64 temperature
bool are_motors_up
string debug_message
```
* we go backt o CMakeLists.txt to add it in the message section (we uncomment the msg section and add it in FILES)
```
## Generate messages in the 'msg' folder
 add_message_files(
   FILES
   HardwareStatus.msg
 )
```
* we go to catwin_ws to build the package with `catkin_make`
* it even generates for Javascript
* our message is now located in *catkin_ws/devel/include/my_robot_msgs/HardwareStatus.h*

### Lecture 46 - Use Your Custom Msg in Your Code

* we go back to our nodes package
* we need to add a depnedency to *my_robot_msgs* package to use the newly created message
* in *package.xml* we add `  <depend>my_robot_msgs</depend>` which is a general dependency tag
* in *CMakeLists.txt* we add 'my_robot_msgs' in the find_package block
* we will implement a new py none in scripts/ 'hw_status_publisher.py' and make it executable
* we add boilerplate rospy node code
* we create the publisher `pub = rospy.Publisher("/my_robot/hardware_status", HardwareStatus, queue_size = 10)`
* and import the message type on top `from my_robot.msgs.msg import HardwareStatus`
* we add the rate and the while loop to publish passing the params we defined
```
	rate = rospy.Rate(5)

	while not rospy.is_shutdown():
		msg = HardwareStatus()
		msg.temperature = 45
		msg.are_motors_up = True
		msg.debug_message = "Everything is running well"
		pub.publish(msg)
		rate.sleep()
```
* we rosrun the node and echo the topic
* NOTE: After each catkin build we need to OPEN A NEW TERMINAL so source of the new .bash file is DOME 
* Or `source ~/.bashrc`

### Lecture 47 - Create your Own Custom Srv

* we will use the already created package *my_robot_msg* for our custom service definition.
* all is set up we just need to put our service source file in a new folder <package>/srv and after add it in the CMakeLists.txt in srv section like we did for msg
* we name our file *ComputeDiskArea.srv*
* we add the code for both messages
```
float64 radius
---
float64 area
```
* following the request --- response convention
* we add it in CMakeLists.txt
```
add_service_files(
   FILES
   ComputeDiskArea.srv
 )
```
* we goto catkin ws to build
* after buils the devel/include/my_robot_msgs/ contains the messages for request and respons as well as the srv .h files
* we can create a server and client to test it in our nodes package

### Lecture 48 - Debug Msg and Srv With Command Line Tools

* we have *rostopic* to debug the topic while *rosmsg* for the message definition
* with `rosmsg -h` we see the available commnds
```
	rosmsg show	Show message description
	rosmsg info	Alias for rosmsg show
	rosmsg list	List all messages
	rosmsg md5	Display message md5sum
	rosmsg package	List messages in a package
	rosmsg packages	List packages that contain messages
```
* with list we see all avaiable messages accordint to the imports. even if we dont use them
* with `rosmsg show my_robot_msgs/HardwareStatus` we see the deinition of our custom message
* same for service with *rosservice* group of commands we debug the service, with *rossrv* the service type used (and its messages) 
* the available commands are
```
	rossrv show	Show service description
	rossrv info	Alias for rossrv show
	rossrv list	List all services
	rossrv md5	Display service md5sum
	rossrv package	List services in a package
	rossrv packages	List packages that contain services
```

### Lecture 49 - Msg & Srv Activity

* we will create a service (/set_led) with a new service definition for the battery / led application
* we will have a battery node (client) and led panel node (server)
* our request will contain led number and state (on = 1). also the response will be success: true (boolean)
* battery state will change from full to empty every 7seconds and back to full in 3 seconds

## Section 7 - Make Your Application Scalable with ROS Params and Launch Files

### Lecture 53 - What is a Paramater?

* In a multipackage ROS application we want to be able to set cross-package global paramaters for the whole system. These parameters are called ROS parameters.
* Example ROS parameters could be. Robot name, Sensors read frreewquency, Execution mode (simulation, testing,production)
* This allows us to avoid code entaglement
* When we launch the ROS Master (`roscore`) the Parameter Server is started automatically
* The Parameter Server is a dictionary containing the grlobal parameters to be available from everywhere
```
/robot_name : "niryo_one"
/sensor_read_frequency : 40
/simulation_mode : false
```
* at any given time a node can read / write add or delete a global parameter
ROS - Parameters:
	* Parameter server: dictionary inside ROS master, accessible globally
	* ROS parameter: one shared variable stored inside the parameter server
	* a ROS paramter has a name and a datatype (Boolean, Int, Double, String, List

### Lecture 54 - Manipulate Parameters with Command Line Tools

* we start our ros master `roscore`
* we see the parameter related terminal commands with `rosparam -h`
```
	rosparam set	set parameter
	rosparam get	get parameter
	rosparam load	load parameters from file
	rosparam dump	dump parameters to file
	rosparam delete	delete parameter
	rosparam list	list parameter names

```
* commonly used a re get set and list `rosparam get /rosdistro`
* with set we can make a new param or set existing one `rosparam set /robot_name "my_robot"` or `rosparam set /sensors_read_freq 40`

### Lecture 55 - Handle Parameters with Python

* we will use ros parameters in the nodes
* we do a python node (edit the number publisher node)
* we want to get the rate as parameter
* we use rospy.get_param `publish_frequency = rospy.get_param("/number_publish_freq")`
* we run and get an error. param is non existing	. we set it in terminal `rosparam set /number_publish_freq 2` 
* we can set param from rospy `rospy.set_param("/another_param","Hello from node")`

### Lecture 56 - Handle Parameters With C++

* we do the same in <package>/src/number_publisher.cpp
* the way to get a ROS Param in C++ using NodeHandle
```
	double publish_frequency;
	nh.getParam("/number_publish_freq",publish_frequency);
	ros::Rate rate(publish_frequency);
```
* in C++ accessing a nonexisting param returns null not exception.
* we make and test
* to set a param `nh.setParam("/another_parameter","Hello from Cpp node");`

### Lecture 57 - What is a Launch File?

* ROS Launch file solves the problem of paramters initialization when we restart the ros master
* unitialized param cause run timerrors for getters
* Launch file allows us to initialize paramters and launch nodes from a file
* in Launch file we can have conditional statements. group params etc

### Lecture 58 - Create a Launch File to Start all Your parameters and Nodes

* in catkin_ws/src we create a new package for launch files 	`catkin_create_pkg my_robot_bringup` no dependencies at all
* we put them in a separate package to be reusable 
* we build with `catkin_make`
* we go in the new package folder 'catkin_ws/src/my_robot_bringup' and add a *launch/* folder
* we create a launch file `touch number_app.launch` and edit it
* the file is basically an xml file
* we add the wrapper
```
<launch>
</launch>
```
* in the launch tag we add our initialization. to set a prameter `<param name="/number_publish_freq" type="double" value="3.0" />`
* we add a second param `<param name="/number_to_publish" type="int" value="230" />`
* with launch file ready we start ourr master `roscore` and use our launchfile with `roslaunch my_robot_bringup number_app.launch` passing the package name that hosts the launch file and the launch file
* our params are available and we can use them in our nodes
* we can start nodes in the launch file
```
	<node name="number_publisher" pkg="my_robot_tutorials" type="number_publisher" />
	<node name="number_counter" pkg="my_robot_tutorials" type="number_counter.py" />
```
* we roslaunch and we see the nodes starting, we have no log though 
* even if i donot start the master and i roslaunch my launch file i see my nodes starting
* roslaunch will start the aster if it finds there is no running
* in this case if i ctrl+c the roslaunch ros master also stops

## Section 8 - Bonus

### Lecture 60 - Replay a Topic with ROS Bags

* ROS Bag is used for testing a robot app. it allows us to record and store messages from a topic and replay them later
* we can record the data from sensors and replay them later when we cannot go out for testing
* rosbag has its own set of commands `rosbag -h`
```
Usage: rosbag <subcommand> [options] [args]

A bag is a file format in ROS for storing ROS message data. The rosbag command can record, replay and manipulate bags.

Available subcommands:
   check  	Determine whether a bag is playable in the current system, or if it can be migrated.
   compress  	Compress one or more bag files.
   decompress  	Decompress one or more bag files.
   decrypt  	Decrypt one or more bag files.
   encrypt  	Encrypt one or more bag files.
   filter  	Filter the contents of the bag.
   fix  	Repair the messages in a bag file so that it can be played in the current system.
   help  
   info  	Summarize the contents of one or more bag files.
   play  	Play back the contents of one or more bag files in a time-synchronized fashion.
   record  	Record a bag file with the contents of specified topics.
   reindex  	Reindexes one or more bag files.

For additional information, see http://wiki.ros.org/rosbag
```
* we start our master and rosrun our publisher `hw_status_publisher.py` 
* we sniff the toipic channel `rostopic echo /my_robot/hardware_status` and its working
* while the topic is playing we record it with `rosbag record /my_robot/hardware_status` passing the name of the ropic. our log says
```
[ INFO] [1547484795.232545654]: Subscribing to /my_robot/hardware_status
[ INFO] [1547484795.236763911]: Recording to 2019-01-14-18-53-15.bag.
```
* we kill it (ctrl+c) and we see that a bag file was added on the PWD the working dir where we run the command
* we can see info about the bag with `rosbag info <bag filename>`
* we kill the node and replay the bag with `rosbag play <file>`
* if we echo the topic we see the messgaes like they were published

### Lecture 61 - Use OOP with ROS - Python

* OOP = Object Oriented Programming
* we have the same node implementation in notes one with OOP and one without
* in OOP we use classes and initializer (constructor) setting local vars
* in OOP methods are in the class and called with self.method()
* in OOP we need to create the class and logidc is in the contructor

### Lecture 62 - Use OOP with ROS - C++

* in C++ all is done in main. (C style)
* In OOP style we use public and private vars.
* in OOP we initialize the class passing the handler. alla func is in contrustor... bad style
* also in the callbacks we pass this in OOP as we the calling context will be different when theuy will be called (JS style)

## Section 9 - Conclusion

### Lecture 65 - Useful Resources

* ROS wiki
* ROS answers
* ROS discourse

# Course 2: ROS Actions

## Section 1 - Introduction

### Lecture 2 - Why ROS Actions? 

* ROS provides 2 main communication tools (Topics and Services)
* ROS Topics = named bus for nodes to send data streams
* ROS Services = synchronus client/server comm
* Services are synchronous and blocking. they are not suitable for complex actions as client is stuck waiting
* say the service initiates an execution on server and we want to cancel it
* how to get feedback while server executes the command initiated with a service
* how the server can handle multiple commands
* ROS Services limitations:
	* Sunchronous
	* Only made for quick actions and computations

### Lecture 3 - What are ROS Actions

* With ROS Actions we again have a Client Node (running an Action Client) and a Server Node (running an Action Server)
* Client will send a Goal (equivalent to ROS Service Request) e.g Move to (x,y)
* Upon receiving the goal the Server will start the execution Asynchronously
* Client continues its execution
* Client can at any time receive the GOal Status from the Server
* Goal Status can have different  values (it gives info on the state of the goal)
* the Action Server can send Feedback during Goal Execution (3.g % of the distance travelled to destination, current position etc)
* Once the Goal execution is finished the Action Server sends a Result back to the Action CLient. The Result can contain data
* During the Goal execution the Action Client can send a Cancel Goal request to the server. Server will cancel execution and return a Result
* All the Communication is handles through ROS Topics. there is a topic for eachtype of message but are not used directly. They are hidden in the Action Server and Client libs (ROS actionlib API)
* To create a Client Node that uses ROS Actions we need to import the ROS actionlib API and use the Action Client class.
* To create a Server Node that uses ROS Actions we need to import the ROS actionlib API and use the Action Server class. 
With ROS Actions we can:
	* Asynchronously execute goals
	* Get status and feedback on the current executed goal(s)
	* Cancel a goal
* In this course we will:
* Start with simple action clients/server
	* Send a goal
	* Get feedback
	* Cancel a goal
* Then we go to next level
	* Handle multiple goals
	* Create our own goal policy
	* and more...


## Section 2 - Discover Actions With SimpleActionClient/SimpleActionServer

### Lecture 6 - Intro

* ROS team has created simplified Action Classes on top of the ActionClient and ActionServer classes. the SimpleActionClient and SimpleActionServer. they can handle only one goal at the time and the goal policy is fixed
* For some application that enough and its a good introduction to the topic.
* Steps to take:
	* create Action definition
	* create the server with the actionlib SimpleActionServer
	* create the client with the actionlib SimpleActionClient
	* discover and experiment

### Lecture 7 - Create an Action Definition and Generate the Action Messages

* NOTE: DUE TO ISSUES WITH Adding ACtions to the existing my_robot_msgs package we create a new 'my_robot2_msgs' in catkin_ws/src we run `catkin_create_pkg my_robot2_msgs roscpp rospy std_msgs actionlib_msgs`
* in our simple applciation the server will have to count up a given number and the client will give teh target number.
* server will give feedback to the client as a % reached by the counter
* we will return the last number reached by the server as Result of the ROS Action
* as Actions use TOpics underneath. we first have to generate some messages
* Action definitions contain not 2 messages (likes ervices) but 3 (Goal,Result,Feedback)
* we will create one package for messages, service and action definitions. normally in projects all these go to a separate package.
* we will use the existing 'my_robot_msgs' package. if we created it from scratch we would use `catkin_create_pkg my_robot_msgs roscpp rospy sts_msgs actionlib_msgs` as we have created it in prev lecture we just have to add the actionlib_msgs
* we add them in CMakeLists.txt
```
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  actionlib_msgs
  message_generation
)
```
```
catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES my_robot_msgs
  CATKIN_DEPENDS roscpp rospy std_msgs actionlib_msgs  message_runtime
#  DEPENDS system_lib
)
```
```
## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
  actionlib_msgs
)
```

* in package.xml we add 'actionlib_msgs' in <build_depend> , <build_export_depend> and   <exec_depend>
* in contrast with previous course he says that we sould add  an <exec_depend> for meesage_generation while in prev lecture it was message_runtime and message_generation was a <build_depend>
* we create a directory named 'action' and cd into it
* we create a file 'CountUntil.action' and write aour action definition in it (much like a serv)
```
#goal
int64 max_number
float64 wait_duration
---
#result
int64 count
---
#feedback
float64 percentage
```
* we uncomment action section in CMakeLists.txt and add the action definition file
```
# Generate actions in the 'action' folder
 add_action_files(
   FILES
   CountUntil.action
 )
```
* we build with catkin_make
* we source .bashrc
* it generated a lot of messages in different languages
* in catkin_ws/devel/include/ we have the generated h files
```
-rw-r--r-- 1 achliopa achliopa  9903 Ιαν  14 23:49 CountUntilActionFeedback.h
-rw-r--r-- 1 achliopa achliopa  7898 Ιαν  14 23:49 CountUntilActionGoal.h
-rw-r--r-- 1 achliopa achliopa 11264 Ιαν  14 23:49 CountUntilAction.h
-rw-r--r-- 1 achliopa achliopa  9794 Ιαν  14 23:49 CountUntilActionResult.h
-rw-r--r-- 1 achliopa achliopa  5517 Ιαν  14 23:49 CountUntilFeedback.h
-rw-r--r-- 1 achliopa achliopa  5655 Ιαν  14 23:49 CountUntilGoal.h
-rw-r--r-- 1 achliopa achliopa  5394 Ιαν  14 23:49 CountUntilResult.h
```
* also in cat_ws/devel/share/my_robot_msg/msg we have the generated msg definitions
* CountUntilGOal.msg is in COuntUntilActionGOal.msg which is in CountUntilAction.msg

### Lecture 8 - Create a Server with the SimleActionServer

* NOTE: Same as in previous led WE CREATE A NEW PACKAGE `catkin_create_pkg my_robot2_tutorials roscpp rospy std_msgs my_robot2_msgs`
* we use the package 'my_robot_tutorials' for the SimpleActionServer implementation. 
* it is ready as we have all the dependencies inside (event our messages package)
* if we were to create it from scratch we should run `catkin_create_pkg my_robot_tutorials roscpp rospy std_msgs my_robot_msgs`
* we go to 'catkin_ws/src/my_robot_tutorials/scripts'
* we create a new file 'count_untill_server.py' and make it executable
* we add boilerplate node python code
* we create a python Class w/ constructo method
```
class CountUntilServer:
	def __init__(self):
```
* in the constructorwe will create the simple action server 
```
		self._as = actionlib.SimpleActionServer("/count_untill",
			CountUntilAction, 
			execute_cb=self.on_goal,
			auto_start=False)
```
* we pass in the action name , the action type (which we import as msg `from my_robot_msgs.msg import CountUntilAction`, the callback and if we want to start the server on creation)
* we start the server `self._as.start()` and set the counter to 0 `self._counter = 0`
* we implement the callback as class method `def on_goal(self, goal):`
* we import the Goal msg `from my_robot_msgs.msg import CountUntilGoal`
* when a client sends the goal the on_goal callback will be triggered. in the callback we log the goal passed
* the complete implementation of the on_goal callback is 
```
	def on_goal(self, goal):
		rospy.loginfo("A goal has been received")
		rospy.loginfo(goal)
		max_number = goal.max_number
		wait_duration = goal.wait_duration
		rate = rospy.Rate(1.0/wait_duration)

		while self._counter < max_number:
			sel_counter += 1
			rate.sleep()

		result = CountUntilResult()
		result.count = self._counter
		self._as.set_succeeded(result)
```
* in the callback:
	* we get the goal msg contents (after inmporting it `from my_robot_msgs.msg import CountUntilGoal`)
	* we start a rate using the wait_duration param
	* we start a loop to simulate execution increasing the object vounter attribute according to the rate.
	* when we exit theloop we create a result message (after mporting the type `from my_robot_msgs.msg import CountUntilResult`)
	* we sent the result data and using the SimpleActionServer we use the set_succeeded method passing the result

* in the main we create a server and spin
```
	server = CountUntilServer()
	rospy.spin()
```
* the ongoal will listen to any goal message coming from the clients
* we start the master and rosrun the node
* with node runnign we check the topics

### Lecture 9 - Create a Client with the SimpleActionClient

* in the scripts folder i create a new file 'count_until_client.py' and make it exec and add boilerplate code
* we create a new class 'CountUntilActionClient' and instantiate in the main
* in the class contructor we create an action client as attribute `self._ac = actionlib.SimpleActionClient("/count_until",CountUntilAction)` we pass the name and the type. we import the type like in server
* in the contructor we have to tell the client to wait for the server to wake up
`self._ac.wait_for_server()`
* we create a new class method callled 'send_goal_and_get_result'. we import CountUntilGoal and usit to send a goal to the server
* then we send the goal using the actionclients send_goal method
* we choose the easy way to block the client waiting for the result. this is not good practice
* then we get back the result all in the same method and log it
```
	def send_goal_and_get_result(self):
		goal = CountUntilGoal(max_number=10, wait_duration=0.5)
		self._ac.send_goal(goal)
		rospy.loginfo("Goal has been sent.")
		self._ac.wait_for_result()
		rospy.loginfo(self._ac.get_result())
```
* our main does only instantiations
```
if __name__ == "__main__":
	rospy.init_node("count_until_client")

	client = CountUntilActionClient()
	client.send_goal_and_get_result()
```
* we test and it works
* `rospy.Duration(3.0)` is the way to   set a timeperiod in rospy

### Lecture 10 - Make your Client Asynchronous

* we use actions to make asynch calls but our client is still synchronous as it waits and stalls waiting for the result (like in service)
* to make it asynchronous we have to use callbacks
* w eadd another the param to the send_goal method. the done_cb (callaback) . the callback is called when server is done when it reaches a done state `self._ac.send_goal(goal, done_cb=self.done_callback)`
* we implement the callback just logging info
```
	def done_callback(self, status, result):
		rospy.loginfo("Status is : "+str(status))
		rospy.loginfo("Result is : "+str(result))
```
* as now we dont wait to keep our process alive we need to spin in main
* we test and it works. our client is asynch now

### Lecture 11 - Send Feedback from the Server tothe Client

* with actions we can send feedback from the server to the client while we are handling the goal
* we will replace the loginf in the goal execution while loop in the server with sending ack feedback we import the Feedback msg `from my_robot2_msgs.msg import CountUntilFeedback`
* after loging in the while loop we send feedback with
```
			feedback = CountUntilFeedback()
			feedback.percentage = float(self._counter) / float(max_number)
			self._as.publish_feedback(feedback)
```
* we need to handle the feedback in the client
* if we echo the feedback with rostopic we see its much more complex
* in client we need to modify the `self._ac.send_goal(goal, done_cb=self.done_callback)` adding the feedback callback `feedback_cb=self.feedback_callback`
* we implement the callback. we just printout the message
```
def feedback_callback(self, feedback):
		rospy.loginfo(feedback)
```
* we test and it works (asynchronous now) with no code blocking

### Lecture 12 - Set a Goal as Succeeded or Aborted

* in our current implementation we have set the goal result as successful.
* however it can be aborted
* we go to the server. we will add a rule. if counter goes >9 it aborts. if it reaches max_num it succeeds. in essence wee will always fail unles we send a goal with max num < 9
* sending back aborted is easy using the SimpleActionServer.set_aborted(Result) method
```
		if success:
			self._as.set_succeeded(result)
		else:
			self._as.set_aborted(result)
```
* success status is 3, aborted is 4

### Lecture 13 - Understand Goal Status

* we can see the GlobalStatus message definitions in [docs](http://docs.ros.org/melodic/actionlib_msgs/html/GoalStatus.html)
* we use actionlib_msgs as a dependency in our package so its available
* whenever there is a state change inthe goal execution the server will send the new goalstatus to the client. goalstatus is also sent  with feedback, result
* we can use the names instead of the vals
* in simple action server there is only one goal so there is no rejection
* some statuses are flagged as terminal.. as client
* the client done callback we have seen so far is looking into exactly that. goal status changes to predefined states

### Lecture 14 - Cancel a Goal

* we ll look now how a client can ask the serverto cancel goal execution
* in the server execution loop we add a check to see if we he received a preempt req from client . if yes we break raisin a flag to send back the proper response
```
			if self._as.is_preempt_requested():
				preempted = True
```
* to return it we use the special funtion set_preempted
```
		if preempted:
			rospy.loginfo("Preempted")
			self._as.set_preempted(result)
```
* now we have to add in clinent a method to request preemption
* we use the `self._ac.cancel_goal()`
* we get back a goal status 2

### Lecture 15 - Debug ROS Topics used in ROS Actions

* while  server is running we have 5 topics related to the action. we can see them in rostopic list
```
/count_until/cancel
/count_until/feedback
/count_until/goal
/count_until/result
/count_until/status
```
* we echo the 5 topics and run the client
* goal contains a timestamp a client id the params. goal has 3 sections header: goal_id: and goal:
* in general these topics contain useful info like timestamps, ids statuses for debugging
* status provides a continuous stream

### Lecture 16 - Use rqt_graph to Get More Info about ROS Topics

* graph shows the action as sqare withg a  3drect for <action>/action_topics
* nodes (cient, server) are seen to exchange info with the topics block 
* if we unclick Actions we see each topic in the action with its connections to the nodes
* we see also who publishes in each topic

### Lecture 17 - C++ Create a Server with the SimpleActionServer

* we compare the 2 implementations C++ and python (C++ is available in course notes)
* imports are the same
* in both a class is defined for the server
* in both a SimpleActionServer is defined as attribute (passing the ActionType) and a counter
* both have constructor. in C++ the two protected attributes are initialized in the contstructor signature using : (initization list
* in actionserver intialization we pass the  name,the on_goal callback in a strange boost::bind sysntax. *_1* passes the params to the on+goal method
* main is the same with python and the callback is very similar (syntax change)
* in C++ in on_goal callback we pass a reference to the goal messate type using a type ConstPtr
* to get goal params we use -> (pointer)
* in C++ in CMakeLists we need to add actionlib in find package
* we add `find_package(Boost REQUIRED COMPONENTS system)` for boost
* in Build we need to add `${Boost_INCLUDE_DIRS}` along with catkin
* we need to add  executables and target_link_libraries like in the first course
* of course `catkin_make`

### Lecture 18 - C++ Create a Server with the SimpleActionClient

* we have same imports (in C++ we import actionlib/client/terminal_state.h)
* main is same
* creation and initialization of the ActionCLient is like Server in C++ different from py
* initalization at constructor is simpler as we dont pass callabck. true starts a thread (like spin to get all callbacks) no need to spin
* in send_goal... things are complex we use boost::bind for the callbacks and *_1* and *_2* for the arguments
* all messages are passed as refs

## Lecture 19 - Documentation for SimpleActionClient and Server

* [Python SimpleActionServer](https://docs.ros.org/melodic/api/actionlib/html/classactionlib_1_1simple__action__server_1_1SimpleActionServer.html)
* [Python SimpleActionClient](https://docs.ros.org/melodic/api/actionlib/html/classactionlib_1_1simple__action__client_1_1SimpleActionClient.html)
* [C++ SimpleActionServer](https://docs.ros.org/melodic/api/actionlib/html/classactionlib_1_1SimpleActionServer.html)
* [C++ SimpleActionClient](https://docs.ros.org/melodic/api/actionlib/html/classactionlib_1_1SimpleActionClient.html)

## Section 3 - Activity: Experiment on SimpleActionClient/SimpleActionServer

### Lecture 21 - Intro

* in this activity we will have to move a mobile robot using actions
* our robot will move along 1 axis from 0 to 100m
* the initial position is at 50m
* THe Client(SimpleActionClient) will send a goal to teh Server(SimpleActionServer)
* the goal
```
# goal
position # m
velocity # m/s
---
# result
position
message
---
# feedback
current_position
```
* we need always to keep track of position
* we will also be able to cancel the goal
* we ll criate a subscriber in the client. when client receives a  message  it will cancel the goal

### Lecture 22 - Create the Action Definition

* we will use the my_robot2_msgs package for the new Action
* we implemetna new action *MoveRobot.action*
```
#goal
int64 position # m
int64 velocity # m/s
---
#result
int64 position
string message
---
#feedback
int64 current_position
```
* we add the action in CMakeLists.txt and build

### Lecture 23 - Create the Server

* im my_robot2_tutorial package we add a new script *move_robot.server* and make it exec and add boilerplate code
* we import all 4 messages from action
* we create a class MoveRobotServer to implement the SimpleActionServer (as an attribute)
* we add a constructor for the class
* we create an object of the class in  main and spin
* in the constructor we instantiate and initialize the SimpleServer as class attribute `self._as = actionlib.SimpleActionServer("/move_robot",MoveRobotAction,
			execute_cb=self.on_goal, auto_start=False)`
* we start the server in constructor `self._as.start()`
* we set the current position as attribute and initialize `self._current_position = 50`
* we log
* we implement the goal callback
* in it we exctract the goal params and do a while loop to simulate moveemnts (goal execution) . we also add the esape functionality according to messageds received and the reply logic
* in the while loop: check for termination,exec(move), send feedback sleep
* we send feedback as separate function
* when client asks for preempt is not guaranteed tha th the server will preempt
* in SimpleActionServer when goal arrives it will be rejected or accpted based on sysntax correctness. in python we are in the  callback if message is accepted so we dont have ahook to send reply toinform user. but we can add contreol code based on the param vals
```
	def send_feedback(self):
		feedback = MoveRobotFeedback()
		feedback.current_position = self._current_position
		self._as.publish_feedback(feedback)

	def on_goal(self, goal):
		rospy.loginfo("A goal has been received")
		rospy.loginfo(goal)

		goal_position = goal.position
		velocity = goal.velocity

		success = False
		preempted = False
		invalid_paramters = False
		message = ""
		rate = rospy.Rate(1.0)

		if goal_position < 0 or goal_position >100:
			message = "Invalid goal position. Must be [0,100]"
			invalid_paramters = True

		if goal_position == self._current_position:
			success = True
			message = "Current Position is already correct!"

		while not rospy.is_shutdown() and not sucess and not invalid_paramters:
			# check for goal termination
			if self._as.is_preempt_requested():
				if goal_position == self._current_position:
					message = "Preempted but already at goal position!"
					success = True
				else:
					message = "Preempted and stopped execution"
					preempted = True
				break
			# exec here
			diff = goal_position - self._current_position
			if diff == 0:
				message = "Success"
				succcess = True
				break
			elif diff < 0:
				if abs(diff) >=velocity:
					self._current_position -= velocity
				else:
					self._current_position -= abs(diff)
			elif diff > 0:
				if diff >= velocity:
					self._current_position += velocity				
				else:
					self._current_position += diff
			# publish feedback
			self.send_feedback()
			rate.sleep()
		# send result
		result = MoveRobotResult()
		result.position = self._current_position
		result.message = message
		rospy.loginfo("send goal result to client")
		if preempted:
			rospy.loginfo("Preempted")
			self._as.set_preempted(result)
		elif success:
			rospy.loginfo("Success")
			self._as.set_succeeded(result)
		else:
			rospy.loginfo("Aborted")
			self._as.set_aborted(result)
```

### Lecture 24 - Create the Client

* we create a new script for client 'move_robot_client.py' and make it executable
* we add boilerplate code
* we add a class MoveRobotClient
* we implement main: instantiate client class, send goal and spin
```
if __name__ == "__main__":
	rospy.init_node("move_robot_client")

	client = MoveRobotClient()
	client.send_goal()
	rospy.spin()
```
* in constructor 
	* we instantiate a SimpleActionClient as attribute `self._ac = actionlib.SimpleActionClient("/move_robot", MoveRobotAction)`
	* we wait for server to start `self._ac.wait_for_server()`
* we implement the send_goal method
	* we create a goal
	* we fill the params
	* we send the goal passing in the callbacks for done and for feedback
* we implement the 2 callbacks
```
	def send_goal(self):
		goal MoveRobotGoal()
		goal.position = 77
		goal.velocity = 5
		self._ac.send_goal(goal, done_cb=self.done_callback,
			feedback_cb=self.feedback_callback)
		rospy.loginfo("Goal has been sent")

	def done_callback(self, status, result):
		rospy.loginfo("Status: "+str(status))
		rospy.loginfo("Result: "+str(result))

	def feedback_callback(self, feedback):
		rospy.loginfo(feedback)
```
* we test with rosrun and all ok, boundary test also ok

### Lecture 25 - Cancel the Goal with Another Subscriber

* first we test our ability to cancel goal through the action
* in send goal we add 
```
rospy.sleep(3)
self._ac.cancel_goal()
```
* we test and it works (preemption)
* if we resend cancel request after succeding the goal in the server we get an error in python
* we will implementt a topic to cancel on publish from a remote client. move robot client acts as subscriber for the topic. we add it in constructor `self.sub = rospy.Subscriber("/cancel_move",Empty,self.cancel_move_callback)` we use std_msgs.Empty.msg
* we add the callback
```
	def cancel_move_callback(self, req):
		rospy.loginfo("Revceived msg to cancel move")
		self._ac.cancel_goal()
```
* we  simulate the publisher with rostopic pub `rostopic pub /cancel_move std_msgs/Empty "{}"
`
* IT WORKS!!!
* usually when we cancel a goal we send a new goal. or we send a new goal without cancelling first one (SimpleActionServer when receiving a new goal cancels the first one and accepts it) 

### Lecture 27 - C++ - Create the Server

* we compare C++ and python code. C++ code in course material. nothing new.. like previous comparison
* no new imports . boost binds is imported in CMakeLists.txt

### Lecture 28 - C++ - Create the Client

* we compare C++ and python code. C++ code in course material. nothing new.. like previous comparison

## Section 4 - Go To The Next Step: ActionClient aqnd ActionServer Explained

### Lecture 31 - What are the SimpleActions Main Limitations?

* SimpleActionClasses are supersets of std ActionClasses 
* they hide some complexity by preseting a set of rules
* SimpleActionServer Limitations:
	* Handles only one goal at a time
	* When new goal arrives. Cancel first goal and accept the new
* SimpleActionClient Limitation:
	* Handles only one goal at a time (if we send a new goal old callbacks are not followed anymore) 

### Lecture 32 - When SimpleActions are Just What We Need

* in SimpleActions the goal policy is prechosen
* if we want to use 1 goal per server and update ionly that goal SimpleAction is OK 

### Lecture 33 - ActionServer Explained

* The Goal Status has a ActionServer StateMachine:
* PENDING State (=0):
	* Purpose: To validate the Goal and apply the Goal Policy. We can put the goals in this state if we implement a goal queue
	* Entry Condition: Receive Goal(Client Triggered)<= ActiveClient
	* Exit Condition: setRejected(Server Triggered)=>REJECTED
	* Exit Condition: setAccepted(Server Triggered)=>ACTIVE
	* Exit Condition: CancelRequest(Client Triggered)=>RECALLING
* ACTIVE state (=1):
	* Purpose: to process, execute the goal
	* Entry Condition: setAccepted(Server Triggered)<=PENDING
	* Exit Condition: setSucceeded(Server Triggered)=>SUCCEEDED
	* Exit Condition: setAborted(Server Triggered)=>ABORTED
	* Exit Condition: CancelRequest(Client Triggered)=>PREEMPTING
* RECALLING state (=7):
	* Purpose: transient state. its up to the user to decide whast he wants to be the next State
	* Entry Condition: CancelRequest(Client Triggered)<=PENDING
	* Exit Condition: setRejected(Server Triggered)=>REJECTED
	* Exit Condition: setAccepted(Server Triggered)=>PREEMPTING
	* Exit Condition: setCancelled(Server Triggered)=>RECALLED
* PREEMPTING state (=6):
	* Purpose: transient state. its up to the user to decide whast he wants to be the next State
	* Entry Condition: CancelRequest(Client Triggered)<=RECALLING
	* Entry Condition: CancelRequest(Client Triggered)<=ACTIVE
	* Exit Condition: setAborted(Server Triggered)=>ABORTED
	* Exit Condition: setCancelled(Server Triggered)=>PREEMPTED
* REJECTED state (Terminal State) (=5):
	* Purpose: Terminal state if paramters are rejected
	* Entry Condition: setRejected(Server Triggered)<= PENDING
	* Entry Condition: setRejected(Server Triggered)<= RECALLING
* RECALLED state (Terminal State) (=8):
	* Entry Condition: setCancelled(Server Triggered)<= RECALLING
* PREEMPTED state (Terminal State) (=2):
	* Entry Condition: setCancelled(Server Triggered)<= PREEMPTING
* SUCCEEDED state (Terminal State) (=3):
	* Purpose: Terminal state if goal is reached
	* Entry Condition: setSucceeded(Server Triggered)<= ACTIVE
	* Entry Condition: setSucceeded(Server Triggered)<= PREEMPTING
* ABORTED state (Terminal State) (=4):
	* Purpose: Terminal state if there is a problem in execution
	* Entry Condition: setAccepted(Server Triggered)<= ACTIVE
	* Entry Condition: setAccepted(Server Triggered)<= PREEMPTING

* In SimpleActiveServer there is no Rejected state. Aborted is used instead
* RECALLING state is seldom used (only if we implement goal queues and keep goals in Pending state)
* Default publish rate of ActionStatus topic is 10Hz
* ActionServer can handle many goals at the same time each wiuth its own statemachine and ID

### Lecture 34 - ActionClient Explained

* Client will try to keep track of the Server State implementing its own StateMachine
* ActionClient Goal StateMachine:
* WAITING_FOR_GOAL_ACK state (=0):
	* Purpose:
	* Entry Condition: (Client Triggered) <= Send Goal
	* Exit Condition: {PENDING} (Server Triggered) => PENDING
	* Exit Condition: {ACTIVE} (Server Triggered) => ACTIVE
	* Exit Condition: Cancel Goal (Client Triggered) => WAITING_FOR_CANCEL_ACK
* PENDING state (=1):
	* Purpose:
	* Entry Condition: {PENDING} (Server Triggered) <= WAITING_FOR_CANCEL_ACK
	* Exit Condition: {RECALLING} (Server Triggered) => RECALLING
	* Exit Condition: {ACTIVE} (Server Triggered) => ACTIVE
	* Exit Condition: {REJECTED} (Server Triggered) => WAITING_FOR_RESULT
	* Exit Condition: Cancel Goal (Client Triggered) => WAITING_FOR_CANCEL_ACK
* ACTIVE state (=2):
	* Purpose:
	* Entry Condition: {ACTIVE} (Server Triggered) <= WAITING_FOR_GOAL_ACK
	* Entry Condition: {ACTIVE} (Server Triggered) <= PENDING
	* Exit Condition: {PREEMPTING} (Server Triggered) => PREEMPTING
	* Exit Condition: {ABORTED|SUCCEEDED} (Server Triggered) => WAITING_FOR_RESULT
	* Exit Condition: Cancel Goal (Client Triggered) => WAITING_FOR_CANCEL_ACK
* RECALLING state (=5):
	* Purpose:
	* Entry Condition: {RECALLING} (Server Triggered) <= PENDING
	* Entry Condition: {RECALLING} (Server Triggered) <= WAITING_FOR_CANCEL_ACK
	* Exit Condition: {PREEMPTING} (Server Triggered) => PREEMPTING
	* Exit Condition: {RECALLED|REJECTED} (Server Triggered) => WAITING_FOR_RESULT
* PREEMPTING state (=6):
	* Purpose:
	* Entry Condition: {PREEMPTING} (Server Triggered) <= ACTIVE
	* Entry Condition: {PREEMPTING} (Server Triggered) <= WAITING_FOR_CANCEL_ACK
	* Entry Condition: {PREEMPTING} (Server Triggered) <= RECALLING
	* Exit Condition: {PREEMPTED|ABORTED|SUCCEEDED} (Server Triggered) => WAITING_FOR_RESULT
* WAITING_FOR_CANCEL_ACK state (=4):
	* Purpose:
	* Entry Condition: Cancel Goal (Client Triggered) <= PENDING
	* Entry Condition: Cancel Goal (Client Triggered) <= ACTIVE
	* Entry Condition: Cancel Goal (Client Triggered) <= WAITING_FOR_GOAL_ACK
	* Exit Condition: {RECALLING} (Server Triggered) => RECALLING
	* Exit Condition: {PREEMPTING} (Server Triggered) => PREEMPTING
* WAITING_FOR_RESULT state (=3):
	* Purpose:
	* Entry Condition: {REJECTED} (Server Triggered) <= PENDING
	* Entry Condition: {RECALLED|REJECTED} (Server Triggered) <= RECALLING
	* Entry Condition: {PREEMPTED|ABORTED|SUCCEEDED} (Server Triggered) <= PREEMPTING
	* Entry Condition: (Server Triggered) <= ACTIVE
	* Exit Condition: Receive Result Message (Server Triggered) => DONE
* DONE state (Terminal State) (=7):
	* Purpose:
	* Entry Condition: Receive Result Message (Server Triggered) <= WAITING_FOR_RESULT
* with {} we show the status change 'new status' as received from ActiveServer in the ActionStatus topic
* An ActionClient can run multiple goals. each with its own statemachine and id
* We can have multiple ActionClients talking to a single ActionServer
* We can use ActionCLient with SimpleActionServer and vice versa
* Goal ID is created by the client, before sending a goal
* A client can cancel the goal from another client
* LOST state is client only (id = 8)

### Lecture 35 - Documentation Links

* [Python Ref List](https://docs.ros.org/melodic/api/actionlib/html/namespaceactionlib.html)
* [Python ActionServer](https://docs.ros.org/melodic/api/actionlib/html/classactionlib_1_1action__server_1_1ActionServer.html)
* [Python ServerGoalHandle](https://docs.ros.org/melodic/api/actionlib/html/classactionlib_1_1server__goal__handle_1_1ServerGoalHandle.html)
* [Python ActionClient](https://docs.ros.org/melodic/api/actionlib/html/classactionlib_1_1action__client_1_1ActionClient.html)
* [Python ClientGoalHandle](https://docs.ros.org/melodic/api/actionlib/html/classactionlib_1_1action__client_1_1ClientGoalHandle.html)
* [C++ ActionServer](https://docs.ros.org/melodic/api/actionlib/html/classactionlib_1_1ActionServer.html)
* [C++ ServerGoalHandle](https://docs.ros.org/melodic/api/actionlib/html/classactionlib_1_1ServerGoalHandle.html)
* [C++ ActionClient](https://docs.ros.org/melodic/api/actionlib/html/classactionlib_1_1ActionClient.html)
* [C++ ClientGoalHandle](https://docs.ros.org/melodic/api/actionlib/html/classactionlib_1_1ClientGoalHandle.html)

## Section 5 Activity: Create a Complete ActionClient and ActionServer

### Lecture 36 - Intro

* we will redo the SimpleActionServer and SimpleActionCLient from CountUntil Exqample.
* we will also apply a policy for accepting only one goal and to put goals in a queue

### Lecture 37 - Create a Server with the ActionServer

* we will use the ActionServe class and the ServerGoalHandle from actionlib
* we create an 'activity_action_server.py' script and make it executable and add boilerplate node rospy code
* we do the same imports as SimpleActionServer create a boilerplate class and instantiate it in main and spin
* in constructor
	* we create an actionserver `self._as = actionlib.ActionServer("/count_until",CountUntilAction,
			self.on_goal, self.on_cancel,auto_start=False)` now we pass 2 callbacks
* we start the server
* the on_goal callback
	* singature `def on_goal(self, goal_handle)` it needs a goal_handle obj
* the on_cancel callback
	* singature `def on_cancel(self, goal_handle)` it needs a goal_handle obj
* we start a simpleactionclient to test and see that goal_handle is an 'actionlib.server_goal_handle.ServerGoalHanlde instance'
* goal handle comes packed with methods we can use to see info about goal
* with .get_goal() we ge the goal params
* we add a 'def process_goal(self,goal_handle):' helper method in the class to process the goal
* in process_goal
	* we extract goal params
	* we need to choose the next state sending the appropriate command to server
	* the command to be accepted has to respect the state machine
	* if we send illegal command eg `goal_handle.set_succeeded()` we get error
	* we will validate and move to a legal state with command
```
	def process_goal(self,goal_handle):
		rospy.loginfo("Processing goal")
		goal = goal_handle.get_goal()
		max_number = goal.max_number
		wait_duration = goal.wait_duration
		
		# Validate parameters
		if max_number > 10:
			goal_handle.set_rejected()
			return
		goal_handle.set_accepted()
```
	* we also do the actual processing like in simple action server (actually impelmenting the bigest part of goal statemachine
```
		counter = 0
		rate = rospy.Rate(1.0/wait_duration)

		success = False
		preempted = False

		while not rospy.is_shutdown():
			counter += 1
			rospy.loginfo(counter)
			# toso cancel request
			if counter >= max_number:
				success = True
				break
			feedback = CountUntilFeedback()
			feedback.percentage = float(counter) / float(max_number)
			goal_handle.publish_feedback(feedback)
			rate.sleep()

		result = CountUntilResult()
		result.count = counter
		rospy.loginfo("Send Result to CLient")

		if preempted:
			rospy.loginfo("Preempted")
			goal_handle.set_canceled(result)
		elif success:
			rospy.loginfo("Succeeded")
			goal_handle.set_canceled(result)
		else:
			rospy.loginfo("Aborted")
			goal_handle.set_aborted()
		rospy.loginfo(" --- Finished processing the goal")
```
* we see that clacel request from client is ignored even if we have a cllabck.
* this happens because we are inb the on_goal callback which prempts the on_cancel while executing
* when cancel is accepted is too late
* we need to make on_goal very fast
* the way to do it is to process the goal in a new thread
* we import the threading python library `import threading`
* we replace process_goal() call in on_goal with
```
		w = threading.Thread(name="Worker",target=self.process_goal, args=(goal_handle,))
		w.start()
```
* what we did was to create a thread to execute process_goal and start it 
* we test aagain and it works (we see the cancel request log)
* now we need to process it (we create a local var `self._cancel_request = False` as gflag. we raise it in on_cancle callback and we process it in process_goal thread while loop)
```
			if self._cancel_request == True:
				self._cancel_request = False
				preempted = True
				break
```
* we need to cancel the flag
* THATS IT!

### Lecture 38 - Create a Client with the ActionClient

* we create 'activity_action_client.py' make it exec and add boiler plate code, cearwinf a boilerplate clase and in main we instantiate it and spin
* we will use from actionlib ActionClient, ClientGoalHandle and CommState (the client goal state machine state)
* in costructor 
	* we create an instance of Actionlib as class attr `self._ac = actionlib.ActionClient("/count_until",CountUntilAction)`
	* we wait the server to start
* we create a send_goal method in class to send the goalto server
	* the signature is `def send_goal(self, max_number, wait_duration):` 
	* we make a CountUntilGoal instance and fill in the params
	* we get a goal_handle when we actially sentd the goal to server and pass in 2 callbacks. one for feedback from server and one for server goal state transitions
```
	def send_goal(self, max_number, wait_duration):
		goal = CountUntilGoal()
		goal.max_number = max_number
		goal.wait_duration = wait_duration
		thing = self._ac.send_goal(goal,
			self.on_transition,
			self.on_feedback)
```
* we add the on_transition callback
* we add the on_feedback callback
* we ROSRUN but we dont see any feedback.
* this happens because the goal_handle we get back from send_goal is local to the send_goal method.
* when the method returns its gone so feedbackcallback is gone too
* we avoid storing it in class . we prefer to return it from send goal and keep it in main 
* now callbacks work. we see 3 transitions in log
* we printout comm_state to see the state ids in transitions and goal_status
```
	def on_transition(self, goal_handle):
		rospy.loginfo("--- Transition callback")
		rospy.loginfo(goal_handle.get_comm_state())
		rospy.loginfo(goal_handle.get_goal_status())
```
* goal status  goes from 1 to 2
* comm state  2 - 6 - 3 -7
* GOAL STATUS tracks the Server Goal Status
* COMM STATE track the CLIENTs state machinbe
* we can get Client goal (state machine) terminal state with `goal_handle.get_terminal_state()`
* we can get get action resutl with `goal_handle.get_result()`
* to cancel a goal we use `goal_handle.cancel()`

### Lecture 39 - Send and Handle Multiple Goals

* we go to activity_action_server
* we start a new thereat to process a goal. in the on_goal method. 
* so the basic part to be able to hanlde multiple goals is there
* we will start 2 goals from client
```
	goal_handle1 = client.send_goal(8, 0.5)
	goal_handle2 = client.send_goal(5, 0.8)
```
* IT WORKS! but not completely
* the on_cancel() in server wot work as when we get the request we dont know for whic h goal it is
* currently it is unpredictable which will stop
* we have to solve it 
* we wont use the cancel request flag. we ll use a dictionary `self._cancel_goals = {}`
* the key will be the goalid and the key the flag
* in on_goal callback we ad dthe goal id in the dictionary `self._cancel_goals[goal_handle.get_goal_id()] = False` and se t flag False
* in on_cancel callback we get the goal_id and set its flag to True `self._cancel_goals[goal_id] = True`
* in process_goal we again get the goal-id and check the dictionary by this keuy for the flag to change state
* we need to remove the goal_id from dictionary when goal is done `self._cancel_goals.pop(goal_id)`
* in client if we run multiple goals there is no easy way to get the id like the server
* we make our own ids by filling in a dictionary `self._goal_handles = {}`
* in main we fill the dict `client._goal_handles["1"] = goal_handle1`
* in callbacks when we trace we use it FOR TRACINGGG/ FOR DEBUGGING. HOLY CRAPPP
```
		index = 0 
		for i in self._goal_handles:
			if self._goal_handles[i] == goal_handle
				index = i
				break
```

### Lecture 40 - Change the Goal Policy

* now we will change the goal policy of the goal
* we will implement a policy to handle only one goal at the time
* if a client sends a goal while another is executed we will not process it. we will reject it
* all mods will be done in the server side
* we add this in on_goal
```
		# Policy to reject a goal if another is in process
		if len(self._cancel_goals) != 0:
			rospy.logwarn("A goal already exists! Reject new goal")
			result = CountUntilResult()
			result.count = -1000
			goal_handle.set_rejected(result)
			return 
```

### Lecture 41 - Place goals in a queue and execute them one by one

* we remove previous prolicy and make a copy of the server script
* in on_goal we will add the goal to a queue
* we will create a queue in constructor as a class atrtribute `self._goal_queue = []` as am array
* in on_goal we do
```
	def on_goal(self, goal_handle):
		rospy.loginfo("Received new goal")
		rospy.loginfo(goal_handle.get_goal())

		self._goal_queue.append(goal_handle)
		self._cancel_goals[goal_handle.get_goal_id()] = False
		return
```
* so just append in cancel dict and goal list the handle and return
* we will run the goals in a queue one at time in a new method `run_queue`
* we instantiate a thread worker in constructor for the run_queue method `w = threading.Thread(name="queue_worker",target=self.run_queue)` and start `w.start()`
* the implementation of run_queue is 
```
	def run_queue(self):
		rate = rospy.Rate(2.0)
		while not rospy.is_shutdown():
			rate.sleep()
			if len(self._goal_queue) > 0:
				self.process_goal(self._goal_queue.pop(0))
```
* in essense we check if there are goal_handles in queue and we proicess the first one (oldest) in a FIFO list style
* we will send 2 goals from client one after the other to test if they are processed sequentialy
* IT WORKS

### Lecture 41 - C++ - Create a Server With the ActionServer

* just a comparison between python and C++ based on the course code samples
* see the CMakeLists.txt file for dependencies and how to add them 
* we use vectors, maps and threads
* instead of dictionary in C++ we use map 
* we use a vector of threads. why? for each new goal we create a thread for non blocking the callbacks to other goals
* in C++ if we just create a thread we have only a pointer and a mem leak
* in the Destructor of th ewclass when thread is finished we join and delete it

### Lecture 42 - C++ - Create a Client with the ActionClient

* just a comparison between python and C++ based on the course code samples
* in C++ we waitforshutdown
