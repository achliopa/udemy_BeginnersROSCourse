; Auto-generated. Do not edit!


(cl:in-package my_robot2_msgs-msg)


;//! \htmlinclude CountUntilGoal.msg.html

(cl:defclass <CountUntilGoal> (roslisp-msg-protocol:ros-message)
  ((max_number
    :reader max_number
    :initarg :max_number
    :type cl:integer
    :initform 0)
   (wait_duration
    :reader wait_duration
    :initarg :wait_duration
    :type cl:float
    :initform 0.0))
)

(cl:defclass CountUntilGoal (<CountUntilGoal>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <CountUntilGoal>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'CountUntilGoal)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_robot2_msgs-msg:<CountUntilGoal> is deprecated: use my_robot2_msgs-msg:CountUntilGoal instead.")))

(cl:ensure-generic-function 'max_number-val :lambda-list '(m))
(cl:defmethod max_number-val ((m <CountUntilGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_robot2_msgs-msg:max_number-val is deprecated.  Use my_robot2_msgs-msg:max_number instead.")
  (max_number m))

(cl:ensure-generic-function 'wait_duration-val :lambda-list '(m))
(cl:defmethod wait_duration-val ((m <CountUntilGoal>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_robot2_msgs-msg:wait_duration-val is deprecated.  Use my_robot2_msgs-msg:wait_duration instead.")
  (wait_duration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <CountUntilGoal>) ostream)
  "Serializes a message object of type '<CountUntilGoal>"
  (cl:let* ((signed (cl:slot-value msg 'max_number)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'wait_duration))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <CountUntilGoal>) istream)
  "Deserializes a message object of type '<CountUntilGoal>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'max_number) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'wait_duration) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<CountUntilGoal>)))
  "Returns string type for a message object of type '<CountUntilGoal>"
  "my_robot2_msgs/CountUntilGoal")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'CountUntilGoal)))
  "Returns string type for a message object of type 'CountUntilGoal"
  "my_robot2_msgs/CountUntilGoal")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<CountUntilGoal>)))
  "Returns md5sum for a message object of type '<CountUntilGoal>"
  "ca8c86ed62b42e478aaac2e19c943016")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'CountUntilGoal)))
  "Returns md5sum for a message object of type 'CountUntilGoal"
  "ca8c86ed62b42e478aaac2e19c943016")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<CountUntilGoal>)))
  "Returns full string definition for message of type '<CountUntilGoal>"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%int64 max_number~%float64 wait_duration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'CountUntilGoal)))
  "Returns full string definition for message of type 'CountUntilGoal"
  (cl:format cl:nil "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======~%#goal~%int64 max_number~%float64 wait_duration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <CountUntilGoal>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <CountUntilGoal>))
  "Converts a ROS message object to a list"
  (cl:list 'CountUntilGoal
    (cl:cons ':max_number (max_number msg))
    (cl:cons ':wait_duration (wait_duration msg))
))
