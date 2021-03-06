// Generated by gencpp from file my_robot2_msgs/MoveRobotGoal.msg
// DO NOT EDIT!


#ifndef MY_ROBOT2_MSGS_MESSAGE_MOVEROBOTGOAL_H
#define MY_ROBOT2_MSGS_MESSAGE_MOVEROBOTGOAL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace my_robot2_msgs
{
template <class ContainerAllocator>
struct MoveRobotGoal_
{
  typedef MoveRobotGoal_<ContainerAllocator> Type;

  MoveRobotGoal_()
    : position(0)
    , velocity(0)  {
    }
  MoveRobotGoal_(const ContainerAllocator& _alloc)
    : position(0)
    , velocity(0)  {
  (void)_alloc;
    }



   typedef int64_t _position_type;
  _position_type position;

   typedef int64_t _velocity_type;
  _velocity_type velocity;





  typedef boost::shared_ptr< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> const> ConstPtr;

}; // struct MoveRobotGoal_

typedef ::my_robot2_msgs::MoveRobotGoal_<std::allocator<void> > MoveRobotGoal;

typedef boost::shared_ptr< ::my_robot2_msgs::MoveRobotGoal > MoveRobotGoalPtr;
typedef boost::shared_ptr< ::my_robot2_msgs::MoveRobotGoal const> MoveRobotGoalConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace my_robot2_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'actionlib_msgs': ['/opt/ros/melodic/share/actionlib_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg'], 'my_robot2_msgs': ['/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "94edb56bed3ad41c3ae8fb360e37e933";
  }

  static const char* value(const ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x94edb56bed3ad41cULL;
  static const uint64_t static_value2 = 0x3ae8fb360e37e933ULL;
};

template<class ContainerAllocator>
struct DataType< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "my_robot2_msgs/MoveRobotGoal";
  }

  static const char* value(const ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
#goal\n\
int64 position # m\n\
int64 velocity # m/s\n\
";
  }

  static const char* value(const ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.position);
      stream.next(m.velocity);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MoveRobotGoal_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::my_robot2_msgs::MoveRobotGoal_<ContainerAllocator>& v)
  {
    s << indent << "position: ";
    Printer<int64_t>::stream(s, indent + "  ", v.position);
    s << indent << "velocity: ";
    Printer<int64_t>::stream(s, indent + "  ", v.velocity);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MY_ROBOT2_MSGS_MESSAGE_MOVEROBOTGOAL_H
