#include <ros/ros.h>
#include <actionlib/client/simple_action_client.h>
#include <actionlib/client/terminal_state.h>

#include <std_msgs/Empty.h>

#include <my_robot_msgs/MoveRobotAction.h>
#include <my_robot_msgs/MoveRobotGoal.h>
#include <my_robot_msgs/MoveRobotResult.h>
#include <my_robot_msgs/MoveRobotFeedback.h>

class MoveRobotClient {
	
	protected:
	ros::NodeHandle _nh;
	actionlib::SimpleActionClient<my_robot_msgs::MoveRobotAction> _ac;
	ros::Subscriber _cancel_subscriber;

	public:
	MoveRobotClient():
		_ac("/move_robot", true)
	{
		ROS_INFO("Wait for the action server to start...");
		_ac.waitForServer();
		ROS_INFO("Server is now up");

		_cancel_subscriber = _nh.subscribe("/cancel_move", 10,
			&MoveRobotClient::cancelMoveCallback, this);
	}

	void cancelMoveCallback(const std_msgs::Empty &msg)
	{
		ROS_INFO("Received message to cancel goal");
		_ac.cancelGoal();
	}

	void sendGoal() {
		my_robot_msgs::MoveRobotGoal goal;
		goal.position = 99;
		goal.velocity = 4;
		_ac.sendGoal(goal,
			boost::bind(&MoveRobotClient::doneCb, this, _1, _2),
			boost::bind(&MoveRobotClient::activeCb, this),
			boost::bind(&MoveRobotClient::feedbackCb, this, _1));
		ROS_INFO("Goal has been sent");
	}

	void doneCb(const actionlib::SimpleClientGoalState& state,
		const my_robot_msgs::MoveRobotResultConstPtr &result)
	{
		ROS_INFO("Finished in state: %s",
			state.toString().c_str());
		ROS_INFO("Move robot result: %d", (int)result->position);
	}

	void activeCb() 
	{
		ROS_INFO("Goal just went active");
	}	

	void feedbackCb(const my_robot_msgs::MoveRobotFeedbackConstPtr &feedback)
	{
		ROS_INFO("Feedback received. Current position: %d", 
			(int)feedback->current_position);
	}
};

int main (int argc, char **argv) 
{
	ros::init(argc, argv, "move_robot_client");
	MoveRobotClient client;
	client.sendGoal();
	ros::spin();
}
