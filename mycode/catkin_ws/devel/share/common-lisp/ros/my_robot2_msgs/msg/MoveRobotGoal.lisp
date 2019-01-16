; Auto-generated. Do not edit!


(cl:in-package my_robot2_msgs-msg)


;//! \htmlinclude MoveRobotGoal.msg.html

(cl:defclass <MoveRobotGoal> (roslisp-msg-protocol:ros-message)
  ((position
    :reader position
    :initarg :position
    :type cl:integer
    :initform 0)
   (velocity
    :reader velocity
    :initarg :velocity
    :type cl:integer
    :initform 0))
)

(cl:defclass MoveRobotGoal (<MoveRobotGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MoveRobotGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MoveRobotGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_robot2_msgs-msg:<MoveRobotGoal> is deprecated: use my_robot2_msgs-msg:MoveRobotGoal instead.")))

(cl:ensure-generic-function 'position-val :lambda-list '(m))
(cl:defmethod position-val ((m <MoveRobotGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_robot2_msgs-msg:position-val is deprecated.  Use my_robot2_msgs-msg:position instead.")
  (position m))

(cl:ensure-generic-function 'velocity-val :lambda-list '(m))
(cl:defmethod velocity-val ((m <MoveRobotGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_robot2_msgs-msg:velocity-val is deprecated.  Use my_robot2_msgs-msg:velocity instead.")
  (velocity m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MoveRobotGoal>) ostream)
  "Serializes a message object of type '<MoveRobotGoal>"
  (cl:let* ((signed (cl:slot-value msg 'position)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'velocity)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MoveRobotGoal>) istream)
  "Deserializes a message object of type '<MoveRobotGoal>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'position) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'velocity) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MoveRobotGoal>)))
  "Returns string type for a message object of type '<MoveRobotGoal>"
  "my_robot2_msgs/MoveRobotGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MoveRobotGoal)))
  "Returns string type for a message object of type 'MoveRobotGoal"
  "my_robot2_msgs/MoveRobotGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MoveRobotGoal>)))
  "Returns md5sum for a message object of type '<MoveRobotGoal>"
  "94edb56bed3ad41c3ae8fb360e37e933")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MoveRobotGoal)))
  "Returns md5sum for a message object of type 'MoveRobotGoal"
  "94edb56bed3ad41c3ae8fb360e37e933")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MoveRobotGoal>)))
  "Returns full string definition for message of type '<MoveRobotGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%int64 position # m~%int64 velocity # m/s~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MoveRobotGoal)))
  "Returns full string definition for message of type 'MoveRobotGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%int64 position # m~%int64 velocity # m/s~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MoveRobotGoal>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MoveRobotGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'MoveRobotGoal
    (cl:cons ':position (position msg))
    (cl:cons ':velocity (velocity msg))
))
