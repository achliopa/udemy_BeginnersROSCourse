#include <ros/ros.h>

#include <my_robot_msgs/HardwareStatus.h>

int main (int argc, char **argv) {
	ros::init(argc, argv, "hardware_status_publisher");
	ros::NodeHandle nh;

	ros::Publisher pub = nh.advertise<my_robot_msgs::HardwareStatus>(
		"/my_robot/hardware_status", 10);

	ros::Rate rate(5);

	while (ros::ok()) {
		my_robot_msgs::HardwareStatus msg;
		msg.temperature = 45;
		msg.are_motors_up = true;
		msg.debug_message = "Everything is running well";
		pub.publish(msg);
		rate.sleep();
	}
}
