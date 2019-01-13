#!/usr/bin/env python

import rospy
from std_msgs.msg import Int64

if __name__ == '__main__':
	rospy.init_node('number_publisher_py', anonymous=True) 

	pub = rospy.Publisher('/number', Int64, queue_size = 10)

	rate = rospy.Rate(2)

	while not rospy.is_shutdown():
		num = Int64()
		num.data = 3000
		pub.publish(num)
		rate.sleep()

	rospy.loginfo("Node was stopped")
