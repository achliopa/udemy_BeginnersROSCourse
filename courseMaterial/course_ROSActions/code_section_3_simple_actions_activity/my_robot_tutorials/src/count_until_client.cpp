#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <actionlib/client/terminal_state.h>

#include <my_robot_msgs/CountUntilAction.h>
#include <my_robot_msgs/CountUntilGoal.h>
#include <my_robot_msgs/CountUntilResult.h>
#include <my_robot_msgs/CountUntilFeedback.h>

class CountUntilClient {

	protected:
	ros::NodeHandle _nh;
	actionlib::SimpleActionClient<my_robot_msgs::CountUntilAction> _ac;

	public:
	CountUntilClient():
		_ac("/count_until", true)
	{
		ROS_INFO("Wait for the action server to start...");
		_ac.waitForServer();
		ROS_INFO("Server is now up.");
	}

	void sendGoal() {
		my_robot_msgs::CountUntilGoal goal;
		goal.max_number = 12;
		goal.wait_duration = 0.3;
		_ac.sendGoal(goal, 
			boost::bind(&CountUntilClient::doneCb, this, _1, _2),
			boost::bind(&CountUntilClient::activeCb, this),
			boost::bind(&CountUntilClient::feedbackCb, this, _1));
		ROS_INFO("Goal has been sent.");

		// Uncomment to cancel the goal after 2 seconds
		//ros::Duration(2.0).sleep();
		//_ac.cancelGoal();
	}

	void doneCb(const actionlib::SimpleClientGoalState& state,
			const my_robot_msgs::CountUntilResultConstPtr &result) 
	{
		ROS_INFO("Finished in state: %s", 
			state.toString().c_str());
		ROS_INFO("Count result: %d", (int)result->count);
	}

	void activeCb() {
		ROS_INFO("Goal just went active");
	}

	void feedbackCb(const my_robot_msgs::CountUntilFeedbackConstPtr &feedback) 
	{
		ROS_INFO("Feedback received. Percentage: %lf", 
			feedback->percentage);
	}
};

int main (int argc, char **argv) {
	ros::init(argc, argv, "count_until_client");
	CountUntilClient client;
	client.sendGoal();
	ros::spin();
}
