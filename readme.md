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

* 