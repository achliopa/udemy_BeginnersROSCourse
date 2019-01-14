#!/usr/bin/env python

import rospy
from std_msgs.msg import Int64
from std_srvs.srv import SetBool

counter = 0;

def handle_reset_number_count(req):
	global counter
	counter = 0
	rospy.loginfo("Counter reset")
	success = True
	return success

def callback_receive_number(msg):
	global counter 
	counter = counter+msg.data

	rospy.loginfo("Number received: ")
	rospy.loginfo(msg)
	pub = rospy.Publisher('/number_count', Int64, queue_size = 10)
	num = Int64()
	num.data = counter
	pub.publish(num)

if __name__ == '__main__':
	rospy.init_node('number_counter_py', anonymous=True) 

	sub = rospy.Subscriber('/number',Int64, callback_receive_number)
	service = rospy.Service('/reset_number_count',SetBool,handle_reset_number_count)
	rospy.spin()