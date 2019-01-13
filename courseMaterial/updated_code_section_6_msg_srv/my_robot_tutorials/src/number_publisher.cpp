#include <ros/ros.h>
#include <std_msgs/Int64.h>

int main (int argc, char **argv)
{
	ros::init(argc, argv, "number_publisher", ros::init_options::AnonymousName);
	ros::NodeHandle nh;

	ros::Publisher pub = nh.advertise<std_msgs::Int64>("/number", 10);

	ros::Rate rate(1);

	while (ros::ok()) {
		std_msgs::Int64 msg;
		msg.data = 2;
		pub.publish(msg);
		rate.sleep();
	}
}
