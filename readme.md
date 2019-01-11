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

### SLecture 6 - Which ROS version to use?

* a new release every year
* recommended is melodic