#include <ros/ros.h>
#include <actionlib/server/action_server.h>
#include <actionlib/server/server_goal_handle.h>

#include <thread>
#include <vector>
#include <map>
#include <string>
#include <queue>

#include <my_robot_msgs/CountUntilAction.h>
#include <my_robot_msgs/CountUntilGoal.h>
#include <my_robot_msgs/CountUntilResult.h>
#include <my_robot_msgs/CountUntilFeedback.h>

typedef actionlib::ServerGoalHandle<my_robot_msgs::CountUntilAction> GoalHandle;

class CountUntilServer {

    protected:
    ros::NodeHandle _nh;
    actionlib::ActionServer<my_robot_msgs::CountUntilAction> _as;

    std::vector<std::thread*> _goalThreads;
    std::map<std::string, bool> _cancelGoals;

    std::queue<GoalHandle> _goalQueue;
    std::thread* _goalQueueThread;

    public:
    CountUntilServer():
        _as(_nh, "/count_until",
            boost::bind(&CountUntilServer::onGoal, this, _1),
            boost::bind(&CountUntilServer::onCancel, this, _1),
            false)
    {
        _as.start();
        ROS_INFO("Action Server has been started.");

        _goalQueueThread = new std::thread(boost::bind(&CountUntilServer::runQueue, this));
    }

    ~CountUntilServer()
    {
        _goalQueueThread->join();
        delete _goalQueueThread;
    }

    void runQueue()
    {
        ros::Rate rate(2.0);
        while (ros::ok())
        {
            rate.sleep();
            if (_goalQueue.size() > 0) {
                processGoal(_goalQueue.front());
                _goalQueue.pop();
            }
            else {
                ROS_INFO("Not doing anything");
            }
        }
    }

    void processGoal(GoalHandle gh)
    {
        boost::shared_ptr<const my_robot_msgs::CountUntilGoal> goal = gh.getGoal();
        std::string goal_id = gh.getGoalID().id;
        int max_number = goal->max_number;
        double wait_duration = goal->wait_duration;
        ROS_INFO("Processing goal: %s", goal_id.c_str());
        ROS_INFO("Max number: %d, wait duration: %lf",
            max_number, wait_duration);

        // Validate parameters
        if (max_number > 10) {
            gh.setRejected();
            return;
        }
        gh.setAccepted();

        int counter = 0;
        ros::Rate rate(1.0/wait_duration);
        bool success = false;
        bool preempted = false;

        while (ros::ok())
        {
            counter++;
            ROS_INFO("%s: %d", goal_id.c_str(), counter);
            if (_cancelGoals[goal_id]) {
                preempted = true;
                break;
            }
            if (counter >= max_number) {
                success = true;
                break;
            }
            my_robot_msgs::CountUntilFeedback feedback;
            feedback.percentage = 
                (double)counter / (double)max_number;
            gh.publishFeedback(feedback);
            rate.sleep();
        }
        
        my_robot_msgs::CountUntilResult result;
        result.count = counter;
        ROS_INFO("Send goal result to client: %s", goal_id.c_str());

        if (preempted) {
            gh.setCanceled(result);
        }
        else if (success) {
            gh.setSucceeded(result);
        }
        else {
            gh.setAborted(result);
        }

        _cancelGoals.erase(goal_id);
    }

    void onGoal(GoalHandle gh)
    {
        ROS_INFO("Received new goal");
        
        _goalQueue.push(gh);
        //_goalThreads.push_back(
        //    new std::thread(boost::bind(&CountUntilServer::processGoal, this, gh)));

        _cancelGoals[gh.getGoalID().id] = false;
    }

    void onCancel(GoalHandle gh)
    {
        ROS_INFO("Cancel request has been received.");
        if (_cancelGoals.count(gh.getGoalID().id) > 0) {
            ROS_INFO("Found goal to cancel");
            _cancelGoals[gh.getGoalID().id] = true;
        }
    }

};

int main (int argc, char **argv)
{
    ros::init(argc, argv, "count_until_server");

    CountUntilServer server;
    ros::spin();
}
