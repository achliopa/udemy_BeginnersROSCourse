#!/usr/bin/env python

import rospy
from std_msgs.msg import Int64

counter = 0;

def callback_receive_number(msg):
	global counter 
	counter = counter+1

	rospy.loginfo("Number received: ")
	rospy.loginfo(msg)
	pub = rospy.Publisher('/number_count', Int64, queue_size = 10)
	num = Int64()
	num.data = counter
	pub.publish(num)

if __name__ == '__main__':
	rospy.init_node('number_counter_py', anonymous=True) 

	sub = rospy.Subscriber('/number',Int64, callback_receive_number)
	
	rospy.spin()