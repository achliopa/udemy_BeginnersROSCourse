#!/usr/bin/env python

import rospy
from std_msgs.msg import Int64

counter = 0
pub = None

def callback_number(msg):
	global counter
	counter += msg.data
	new_msg = Int64()
	new_msg.data = counter
	pub.publish(new_msg)

if __name__ == '__main__':
	rospy.init_node('number_counter')

	sub = rospy.Subscriber("/number", Int64, callback_number)

	pub = rospy.Publisher("/number_count", Int64, queue_size=10)

	rospy.spin()
