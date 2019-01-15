#!/usr/bin/env python

import rospy
import actionlib
from my_robot2_msgs.msg import CountUntilAction

class CountUntilActionClient:

	def __init__(self):
		self._ac = actionlib.SimpleActionClient("/count_until", CountUntilAction)
		self._ac.wait_for_server()
		rospy.loginfo("ActionServer is Up, we can send new goals")

	def 

if __name__ == "__main__":
	rospy.init_node("count_until_client")

	client = CountUntilActionClient()