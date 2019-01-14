#include <ros/ros.h>
#include <std_msgs/Int64.h>

int main(int argc, char **argv){
	ros::init(argc,argv,"number_publisher_cpp", ros::init_options::AnonymousName);
	ros::NodeHandle nh;

	ros::Publisher pub = nh.advertise<std_msgs::Int64>("/number", 10);

	double publish_frequency;
	nh.getParam("/number_publish_freq",publish_frequency);
	int number;
	nh.getParam("/number_to_publish",number);
	nh.setParam("/just_another_param","Hello from Cpp node");
	ros::Rate rate(publish_frequency);
	while(ros::ok()){
		std_msgs::Int64 num;
		// num.data = 5000;
		num.data = number;
		pub.publish(num);
		rate.sleep();
	}
}