#!/usr/bin/env python

import threading
import rospy
import actionlib
from my_robot2_msgs.msg import CountUntilAction
from my_robot2_msgs.msg import CountUntilGoal
from my_robot2_msgs.msg import CountUntilResult
from my_robot2_msgs.msg import CountUntilFeedback

class CountUntilServer:

	def __init__(self):
		self._as = actionlib.ActionServer("/count_until",CountUntilAction,
			self.on_goal, self.on_cancel,auto_start=False)
		self._as.start()
		rospy.loginfo("Action Server has been started")
		self._cancel_request = False

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

		counter = 0
		rate = rospy.Rate(1.0/wait_duration)

		success = False
		preempted = False

		while not rospy.is_shutdown():
			counter += 1
			rospy.loginfo(counter)
			if self._cancel_request == True:
				self._cancel_request = False
				preempted = True
				break
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

	def on_goal(self, goal_handle):
		rospy.loginfo("Received new goal")
		rospy.loginfo(goal_handle.get_goal())

		w = threading.Thread(name="Worker",target=self.process_goal, args=(goal_handle,))
		w.start()

	def on_cancel(self, goal_handle):
		rospy.loginfo("Received cancel request")
		self._cancel_request = True

if __name__ == "__main__":
	rospy.init_node("count_until_server")

	server = CountUntilServer()
	rospy.spin()