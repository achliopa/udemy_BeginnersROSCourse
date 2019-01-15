#!/usr/bin/env python

import rospy
import actionlib

from my_robot_msgs.msg import CountUntilAction
from my_robot_msgs.msg import CountUntilGoal
from my_robot_msgs.msg import CountUntilResult
from my_robot_msgs.msg import CountUntilFeedback

class CountUntilServer:

    def __init__(self):
        self._as = actionlib.SimpleActionServer('/count_until',
                CountUntilAction, execute_cb=self.on_goal, 
				auto_start=False)
        self._as.start()

        self._counter = 0
        rospy.loginfo("Simple Action Server has been started")

    def on_goal(self, goal):
        rospy.loginfo("A goal has been received!")
        rospy.loginfo(goal)

        max_number = goal.max_number
        wait_duration = goal.wait_duration

        self._counter = 0
        rate = rospy.Rate(1.0/wait_duration)

        success = False
        preempted = False

        while not rospy.is_shutdown():
            self._counter += 1
            if self._as.is_preempt_requested():
                preempted = True
                break
            if self._counter > 9:
                break
            if self._counter >= max_number:
                success = True
                break
            rospy.loginfo(self._counter)
            feedback = CountUntilFeedback()
            feedback.percentage = \
				float(self._counter) / float(max_number)
            self._as.publish_feedback(feedback)
            rate.sleep()

        result = CountUntilResult()
        result.count = self._counter
        rospy.loginfo("send goal result to client")

        if preempted:
            rospy.loginfo("Preempted")
            self._as.set_preempted(result)
        elif success:
            rospy.loginfo("Success")
            self._as.set_succeeded(result)
        else:
            rospy.loginfo("Failure")
            self._as.set_aborted(result)

if __name__ == '__main__':
    rospy.init_node('count_until_server')

    server = CountUntilServer()

    rospy.spin()
