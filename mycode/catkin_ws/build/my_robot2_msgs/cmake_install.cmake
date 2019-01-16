# Install script for directory: /home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/src/my_robot2_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/my_robot2_msgs/action" TYPE FILE FILES
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/src/my_robot2_msgs/action/CountUntil.action"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/src/my_robot2_msgs/action/MoveRobot.action"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/my_robot2_msgs/msg" TYPE FILE FILES
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/CountUntilAction.msg"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/CountUntilActionGoal.msg"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/CountUntilActionResult.msg"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/CountUntilActionFeedback.msg"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/CountUntilGoal.msg"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/CountUntilResult.msg"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/CountUntilFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/my_robot2_msgs/msg" TYPE FILE FILES
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/MoveRobotAction.msg"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/MoveRobotActionGoal.msg"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/MoveRobotActionResult.msg"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/MoveRobotActionFeedback.msg"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/MoveRobotGoal.msg"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/MoveRobotResult.msg"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/my_robot2_msgs/msg/MoveRobotFeedback.msg"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/my_robot2_msgs/cmake" TYPE FILE FILES "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/build/my_robot2_msgs/catkin_generated/installspace/my_robot2_msgs-msg-paths.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/include/my_robot2_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/roseus/ros/my_robot2_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/common-lisp/ros/my_robot2_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/share/gennodejs/ros/my_robot2_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  execute_process(COMMAND "/usr/bin/python2" -m compileall "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/lib/python2.7/dist-packages/my_robot2_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/devel/lib/python2.7/dist-packages/my_robot2_msgs")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/build/my_robot2_msgs/catkin_generated/installspace/my_robot2_msgs.pc")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/my_robot2_msgs/cmake" TYPE FILE FILES "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/build/my_robot2_msgs/catkin_generated/installspace/my_robot2_msgs-msg-extras.cmake")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/my_robot2_msgs/cmake" TYPE FILE FILES
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/build/my_robot2_msgs/catkin_generated/installspace/my_robot2_msgsConfig.cmake"
    "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/build/my_robot2_msgs/catkin_generated/installspace/my_robot2_msgsConfig-version.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/my_robot2_msgs" TYPE FILE FILES "/home/achliopa/workspace/udemy/udemy_BeginnersROSCourse/mycode/catkin_ws/src/my_robot2_msgs/package.xml")
endif()

