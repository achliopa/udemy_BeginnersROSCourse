#include <ros/ros.h>
#include <std_msgs/Int64.h>

int counter = 0;
ros::Publisher pub;

void callback_receive_number(const std_msgs::Int64& msg){
	counter +=msg.data;
	std_msgs::Int64 num;
	num.data = counter;
	pub.publish(num);
}

int main(int argc, char **argv){
	ros::init(argc,argv,"number_coutner_cpp",ros::init_options::AnonymousName);
	ros::NodeHandle nh;

	ros::Subscriber sub = nh.subscribe("/number", 1000, callback_receive_number);

	pub = nh.advertise<std_msgs::Int64>("/number_count", 10);

	ros::spin();
}