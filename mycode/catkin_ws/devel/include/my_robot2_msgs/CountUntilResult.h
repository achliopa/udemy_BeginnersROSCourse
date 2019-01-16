// Generated by gencpp from file my_robot2_msgs/CountUntilResult.msg
// DO NOT EDIT!


#ifndef MY_ROBOT2_MSGS_MESSAGE_COUNTUNTILRESULT_H
#define MY_ROBOT2_MSGS_MESSAGE_COUNTUNTILRESULT_H


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
struct CountUntilResult_
{
  typedef CountUntilResult_<ContainerAllocator> Type;

  CountUntilResult_()
    : count(0)  {
    }
  CountUntilResult_(const ContainerAllocator& _alloc)
    : count(0)  {
  (void)_alloc;
    }



   typedef int64_t _count_type;
  _count_type count;





  typedef boost::shared_ptr< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> const> ConstPtr;

}; // struct CountUntilResult_

typedef ::my_robot2_msgs::CountUntilResult_<std::allocator<void> > CountUntilResult;

typedef boost::shared_ptr< ::my_robot2_msgs::CountUntilResult > CountUntilResultPtr;
typedef boost::shared_ptr< ::my_robot2_msgs::CountUntilResult const> CountUntilResultConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> >::stream(s, "", v);
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
struct IsFixedSize< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "8dbac33d2eb67bfeeedd516d65fec846";
  }

  static const char* value(const ::my_robot2_msgs::CountUntilResult_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x8dbac33d2eb67bfeULL;
  static const uint64_t static_value2 = 0xeedd516d65fec846ULL;
};

template<class ContainerAllocator>
struct DataType< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "my_robot2_msgs/CountUntilResult";
  }

  static const char* value(const ::my_robot2_msgs::CountUntilResult_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> >
{
  static const char* value()
  {
    return "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======\n\
#result\n\
int64 count\n\
";
  }

  static const char* value(const ::my_robot2_msgs::CountUntilResult_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.count);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct CountUntilResult_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::my_robot2_msgs::CountUntilResult_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::my_robot2_msgs::CountUntilResult_<ContainerAllocator>& v)
  {
    s << indent << "count: ";
    Printer<int64_t>::stream(s, indent + "  ", v.count);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MY_ROBOT2_MSGS_MESSAGE_COUNTUNTILRESULT_H