#!/usr/bin/env python

import rospy
from my_robot_msgs.srv import SetLed

led_states = [0,0,0]

def callback_set_led(req):
	global led_states

	led_num = req.led_number
	state = req.state
	if (led_num > len(led_states)) or (led_num <= 0):
		return False
	if state == 0 or state == 1:
		led_states[led_num-1] = state
		return True
	return False


if __name__ == "__main__":
	rospy.init_node("led_panel")

	server = rospy.Service("/set_led",SetLed,callback_set_led)

	rate = rospy.Rate(10)

	while not rospy.is_shutdown():
		rospy.loginfo(led_states)
		rate.sleep()