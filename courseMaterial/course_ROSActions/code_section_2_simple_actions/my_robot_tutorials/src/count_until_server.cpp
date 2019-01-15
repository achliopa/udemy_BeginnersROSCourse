#include <ros/ros.h>
#include <actionlib/server/simple_action_server.h>

#include <my_robot_msgs/CountUntilAction.h>
#include <my_robot_msgs/CountUntilGoal.h>
#include <my_robot_msgs/CountUntilResult.h>
#include <my_robot_msgs/CountUntilFeedback.h>

class CountUntilServer {

	protected:
	ros::NodeHandle _nh;
	actionlib::SimpleActionServer<my_robot_msgs::CountUntilAction> _as;
	int _counter;
	
	public:
	CountUntilServer(): 
		_as(_nh, "/count_until", 
			boost::bind(&CountUntilServer::onGoal, this, _1), 
			false),
		_counter(0)
	{
		_as.start();
		ROS_INFO("Simple Action Server has been started.");
	}

	void onGoal(
		const my_robot_msgs::CountUntilGoalConstPtr &goal) 
	{
		ROS_INFO("Goal received"); 

		int max_number = goal->max_number;
		double wait_duration = goal->wait_duration;
		ROS_INFO("Max number : %d, wait duration : %lf", 
			max_number, wait_duration);

		_counter = 0;
		ros::Rate rate(1.0/wait_duration);

		bool success = false;
		bool preempted = false;

		while (ros::ok()) {
			_counter++;
			if (_as.isPreemptRequested()) {
				preempted = true;
				break;
			}
			if (_counter > 9) {
				break;
			}
			if (_counter > max_number) {
				success = true;
				break;
			}
			ROS_INFO("%d", _counter);
			my_robot_msgs::CountUntilFeedback feedback;
			feedback.percentage = 
				(double)_counter / (double)max_number;
			_as.publishFeedback(feedback);
			rate.sleep();
		}
		

		my_robot_msgs::CountUntilResult result;
		result.count = _counter;
		ROS_INFO("Send goal result to client");

		if (preempted) {
			ROS_INFO("Preempted");
			_as.setPreempted(result);
		}
		else if (success) {
			ROS_INFO("Success");
			_as.setSucceeded(result);
		}
		else {
			ROS_INFO("Aborted");
			_as.setAborted(result);
		}
	}
};

int main (int argc, char **argv) {
	ros::init(argc, argv, "count_until_server");

	ROS_INFO("About to start server");

	CountUntilServer server;
	ros::spin();
}


