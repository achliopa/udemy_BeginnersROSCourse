#!/usr/bin/env python

import rospy
import actionlib
from my_robot2_msgs.msg import CountUntilAction
from my_robot2_msgs.msg import CountUntilGoal

class CountUntilClient:

	def __init__(self):
		self._ac = actionlib.ActionClient("/count_until",CountUntilAction)
		self._ac.wait_for_server()
		rospy.loginfo("Action Server UP")

	def on_transition(self, goal_handle):
		rospy.loginfo("--- Transition callback")
		rospy.loginfo(goal_handle.get_comm_state())
		rospy.loginfo(goal_handle.get_goal_status())

		if goal_handle.get_comm_state() == 2:
			rospy.loginfo("Goal just went active")
		if goal_handle.get_comm_state() == 7:
			rospy.loginfo("Goal is done")
			rospy.loginfo(goal_handle.get_terminal_state())
			rospy.loginfo(goal_handle.get_result())

	def on_feedback(self, goal_handle, feedback):
		# rospy.loginfo("--- Feedback callback")
		# rospy.loginfo(feedback)
		pass

	def send_goal(self, max_number, wait_duration):
		goal = CountUntilGoal()
		goal.max_number = max_number
		goal.wait_duration = wait_duration
		rospy.loginfo("Send Goal")
		goal_handle = self._ac.send_goal(goal,
			self.on_transition,
			self.on_feedback)
		return goal_handle


if __name__ == "__main__":
	rospy.init_node("count_until_client")

	client = CountUntilClient()

	goal_handle = client.send_goal(8, 0.5)
	rospy.sleep(1)
	goal_handle.cancel()
	rospy.spin()