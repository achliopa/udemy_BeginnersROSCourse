#include <ros/ros.h>
#include <std_msgs/Int64.h>
#include <std_srvs/SetBool.h>

int counter = 0;
ros::Publisher pub;

bool handle_reset_number_counter(std_srvs::SetBool::Request &req,
								std_srvs::SetBool::Response &res) {
	ROS_INFO("Reset Counter");
	counter = 0;
	res.success = true;
	return true;
}

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
	ros::ServiceServer server = nh.advertiseService("/reset_number_count",handle_reset_number_counter);
	pub = nh.advertise<std_msgs::Int64>("/number_count", 10);

	ros::spin();
}