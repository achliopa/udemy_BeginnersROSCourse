#include <ros/ros.h>

#include <my_robot_msgs/SetLed.h>

#define LED_ARRAY_SIZE 3

int led_states[LED_ARRAY_SIZE] = {0};

bool callback_set_led(my_robot_msgs::SetLed::Request &req,
					  my_robot_msgs::SetLed::Response &res) 
{
	int led_number = req.led_number;
	int state = req.state;

	if ((led_number > LED_ARRAY_SIZE) || (led_number <= 0)) {
		res.success = false;
		return true;
	}
	if (!(state == 0 || state == 1)){
		res.success = false;
		return true;
	}

	led_states[led_number -1] = state;
	ROS_INFO("[%d, %d, %d]", led_states[0], led_states[1], led_states[2]);

	res.success = true;
	return true;
}

int main (int argc, char **argv) {
	ros::init(argc, argv, "led_panel");
	ros::NodeHandle nh;

	ros::ServiceServer server = nh.advertiseService("/set_led",
		callback_set_led);

	ROS_INFO("[%d, %d, %d]", led_states[0], led_states[1], led_states[2]);

	ros::spin();
}
