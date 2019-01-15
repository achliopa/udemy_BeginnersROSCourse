#!/usr/bin/env python

import rospy
import actionlib
from my_robot_msgs.msg import MoveRobotAction
from my_robot_msgs.msg import MoveRobotFeedback
from my_robot_msgs.msg import MoveRobotResult

class MoveRobotServer:

    def __init__(self):
        self._as = actionlib.SimpleActionServer('/move_robot',
            MoveRobotAction, execute_cb=self.on_goal, auto_start=False)
        self._as.start()

        self._current_position = 50
        rospy.loginfo("Server has been started")
    
    def send_feedback(self):
        feedback = MoveRobotFeedback()
        feedback.current_position = self._current_position
        self._as.publish_feedback(feedback)

    def on_goal(self, goal):
        rospy.loginfo("A goal has been received!")
        rospy.loginfo(goal)

        goal_position = goal.position
        velocity = goal.velocity

        success = False
        preempted = False
        invalid_parameters = False
        message = ""
        rate = rospy.Rate(1.0)

        if goal_position < 0 or goal_position > 100:
            message = "Invalid goal position, must be [0-100]"
            invalid_parameters = True

        if goal_position == self._current_position:
            success = True
            message = "Current position is already correct!"

        while not rospy.is_shutdown() and not success \
            and not invalid_parameters:
            if self._as.is_preempt_requested():
                if goal_position == self._current_position:
                    message = "Preempted but already at goal position"
                    success = True
                else:
                    message = "Preempted and stopped execution"
                    preempted = True
                break

            diff = goal_position - self._current_position

            if diff == 0:
                message = "Success"
                success = True
                break
            elif diff < 0:
                if abs(diff) >= velocity:
                    self._current_position -= velocity
                else:
                    self._current_position -= abs(diff)
            elif diff > 0:
                if diff >= velocity:
                    self._current_position += velocity
                else:
                    self._current_position += diff
            
            self.send_feedback()
            rate.sleep()

        result = MoveRobotResult()
        result.position = self._current_position
        result.message = message
        rospy.loginfo("Send goal result to client")

        if preempted:
            rospy.loginfo("Preemted")
            self._as.set_preempted(result)
        elif success:
            rospy.loginfo("Success")
            self._as.set_succeeded(result)
        else:
            rospy.loginfo("Aborted")
            self._as.set_aborted(result)


if __name__ == '__main__':
    rospy.init_node('move_robot_server')

    server = MoveRobotServer()

    rospy.spin()

