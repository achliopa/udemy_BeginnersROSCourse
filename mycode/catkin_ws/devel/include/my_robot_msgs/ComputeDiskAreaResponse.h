// Generated by gencpp from file my_robot_msgs/ComputeDiskAreaResponse.msg
// DO NOT EDIT!


#ifndef MY_ROBOT_MSGS_MESSAGE_COMPUTEDISKAREARESPONSE_H
#define MY_ROBOT_MSGS_MESSAGE_COMPUTEDISKAREARESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace my_robot_msgs
{
template <class ContainerAllocator>
struct ComputeDiskAreaResponse_
{
  typedef ComputeDiskAreaResponse_<ContainerAllocator> Type;

  ComputeDiskAreaResponse_()
    : area(0.0)  {
    }
  ComputeDiskAreaResponse_(const ContainerAllocator& _alloc)
    : area(0.0)  {
  (void)_alloc;
    }



   typedef double _area_type;
  _area_type area;





  typedef boost::shared_ptr< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> const> ConstPtr;

}; // struct ComputeDiskAreaResponse_

typedef ::my_robot_msgs::ComputeDiskAreaResponse_<std::allocator<void> > ComputeDiskAreaResponse;

typedef boost::shared_ptr< ::my_robot_msgs::ComputeDiskAreaResponse > ComputeDiskAreaResponsePtr;
typedef boost::shared_ptr< ::my_robot_msgs::ComputeDiskAreaResponse const> ComputeDiskAreaResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace my_robot_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg'], 'my_robot_msgs': ['/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/src/my_robot_msgs/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "502b7bd5115b3b4f57d03446f9208d12";
  }

  static const char* value(const ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x502b7bd5115b3b4fULL;
  static const uint64_t static_value2 = 0x57d03446f9208d12ULL;
};

template<class ContainerAllocator>
struct DataType< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "my_robot_msgs/ComputeDiskAreaResponse";
  }

  static const char* value(const ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 area\n\
";
  }

  static const char* value(const ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.area);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ComputeDiskAreaResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::my_robot_msgs::ComputeDiskAreaResponse_<ContainerAllocator>& v)
  {
    s << indent << "area: ";
    Printer<double>::stream(s, indent + "  ", v.area);
  }
};

} // namespace message_operations
} // namespace ros

#endif // MY_ROBOT_MSGS_MESSAGE_COMPUTEDISKAREARESPONSE_H
