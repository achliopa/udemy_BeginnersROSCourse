#!/usr/bin/env python

import rospy
import actionlib
from my_robot2_msgs.msg import MoveRobotAction
from my_robot2_msgs.msg import MoveRobotGoal
from my_robot2_msgs.msg import MoveRobotResult
from my_robot2_msgs.msg import MoveRobotFeedback

class MoveRobotClient:

	def __init__(self):
		self._ac = actionlib.SimpleActionClient("/move_robot", MoveRobotAction)
		self._ac.wait_for_server()
		rospy.loginfo("Server is up! Let's send a goal!")

	def send_goal(self):
		goal = MoveRobotGoal()
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

if __name__ == "__main__":
	rospy.init_node("move_robot_client")

	client = MoveRobotClient()
	client.send_goal()
	rospy.spin()