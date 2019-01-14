#!/usr/bin/env python

import rospy
from std_msgs.msg import Int64

if __name__ == '__main__':
	rospy.init_node('number_publisher_py', anonymous=True) 

	pub = rospy.Publisher('/number', Int64, queue_size = 10)

	publish_frequency = rospy.get_param("/number_publish_freq")
	number = rospy.get_param("/number_to_publish")
	rospy.set_param("/another_param","Hello from node")
	rate = rospy.Rate(publish_frequency)

	while not rospy.is_shutdown():
		num = Int64()
		num.data = number
		pub.publish(num)
		rate.sleep()

	rospy.loginfo("Node was stopped")
