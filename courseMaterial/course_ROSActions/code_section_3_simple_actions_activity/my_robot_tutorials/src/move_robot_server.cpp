#include <ros/ros.h>
#include <actionlib/server/simple_action_server.h>

#include <string>

#include <my_robot_msgs/MoveRobotAction.h>
#include <my_robot_msgs/MoveRobotGoal.h>
#include <my_robot_msgs/MoveRobotResult.h>
#include <my_robot_msgs/MoveRobotFeedback.h>

class MoveRobotServer {

	protected:
	ros::NodeHandle _nh;
	actionlib::SimpleActionServer<my_robot_msgs::MoveRobotAction> _as;
	int _current_position;

	public:
	MoveRobotServer():
		_as(_nh, "/move_robot",
		boost::bind(&MoveRobotServer::onGoal, this, _1),
		false),
		_current_position(50)
	{
		_as.start();
		ROS_INFO("Move Robot server has been started");
	}

	void sendFeedback()
	{
		my_robot_msgs::MoveRobotFeedback feedback;
		feedback.current_position = _current_position;
		_as.publishFeedback(feedback);
	}

	void onGoal(const my_robot_msgs::MoveRobotGoalConstPtr &goal)
	{
		ROS_INFO("Goal received");
		int goal_position = goal->position;
		int velocity = goal-> velocity;
		ROS_INFO("Goal position: %d, Velocity: %d", 
			goal_position, velocity);

		bool success = false;
		bool preempted = false;
		bool invalid_parameters = false;
		std::string message = "";
		ros::Rate rate(1.0);

		if (goal_position < 0 || goal_position > 100) {
			message = "Invalid goal position, must be [0-100]";
			invalid_parameters = true;
		}

		if (goal_position == _current_position) {
			success = true;
			message = "Current position is already correct!";
		}

		while (ros::ok() && !success && !invalid_parameters) {
			if (_as.isPreemptRequested()) {
				if (goal_position == _current_position) {
					message = "Preempted but already at goal position";
					success = true;
				}
				else {
					message = "Preempted and stopped execution";
					preempted = true;
				}
				break;
			}

			int diff = goal_position - _current_position;

			if (diff == 0) {
				message = "Success";
				success = true;
				break;
			}
			else if (diff < 0) {
				if (abs(diff) >= velocity) {
					_current_position -= velocity;
				}
				else {
					_current_position -= abs(diff);
				}
			}
			else if (diff > 0) {
				if (diff >= velocity) {
					_current_position += velocity;
				}
				else {
					_current_position += diff;
				}
			}

			sendFeedback();
			rate.sleep();
		}

		my_robot_msgs::MoveRobotResult result;
		result.position = _current_position;
		result.message = message;
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
	ros::init(argc, argv, "move_robot_server");

	MoveRobotServer server;
	ros::spin();
}

