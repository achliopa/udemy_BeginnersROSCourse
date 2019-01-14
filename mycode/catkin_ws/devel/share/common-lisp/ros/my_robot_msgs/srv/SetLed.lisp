; Auto-generated. Do not edit!


(cl:in-package my_robot_msgs-srv)


;//! \htmlinclude SetLed-request.msg.html

(cl:defclass <SetLed-request> (roslisp-msg-protocol:ros-message)
  ((led_number
    :reader led_number
    :initarg :led_number
    :type cl:integer
    :initform 0)
   (state
    :reader state
    :initarg :state
    :type cl:integer
    :initform 0))
)

(cl:defclass SetLed-request (<SetLed-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetLed-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetLed-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_robot_msgs-srv:<SetLed-request> is deprecated: use my_robot_msgs-srv:SetLed-request instead.")))

(cl:ensure-generic-function 'led_number-val :lambda-list '(m))
(cl:defmethod led_number-val ((m <SetLed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_robot_msgs-srv:led_number-val is deprecated.  Use my_robot_msgs-srv:led_number instead.")
  (led_number m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <SetLed-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_robot_msgs-srv:state-val is deprecated.  Use my_robot_msgs-srv:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetLed-request>) ostream)
  "Serializes a message object of type '<SetLed-request>"
  (cl:let* ((signed (cl:slot-value msg 'led_number)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'state)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetLed-request>) istream)
  "Deserializes a message object of type '<SetLed-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'led_number) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'state) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetLed-request>)))
  "Returns string type for a service object of type '<SetLed-request>"
  "my_robot_msgs/SetLedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLed-request)))
  "Returns string type for a service object of type 'SetLed-request"
  "my_robot_msgs/SetLedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetLed-request>)))
  "Returns md5sum for a message object of type '<SetLed-request>"
  "a5cba455e6c34810630dc8f80babd86a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetLed-request)))
  "Returns md5sum for a message object of type 'SetLed-request"
  "a5cba455e6c34810630dc8f80babd86a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetLed-request>)))
  "Returns full string definition for message of type '<SetLed-request>"
  (cl:format cl:nil "int64 led_number~%int64 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetLed-request)))
  "Returns full string definition for message of type 'SetLed-request"
  (cl:format cl:nil "int64 led_number~%int64 state~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetLed-request>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetLed-request>))
  "Converts a ROS message object to a list"
  (cl:list 'SetLed-request
    (cl:cons ':led_number (led_number msg))
    (cl:cons ':state (state msg))
))
;//! \htmlinclude SetLed-response.msg.html

(cl:defclass <SetLed-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass SetLed-response (<SetLed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetLed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetLed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_robot_msgs-srv:<SetLed-response> is deprecated: use my_robot_msgs-srv:SetLed-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <SetLed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_robot_msgs-srv:success-val is deprecated.  Use my_robot_msgs-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetLed-response>) ostream)
  "Serializes a message object of type '<SetLed-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetLed-response>) istream)
  "Deserializes a message object of type '<SetLed-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetLed-response>)))
  "Returns string type for a service object of type '<SetLed-response>"
  "my_robot_msgs/SetLedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLed-response)))
  "Returns string type for a service object of type 'SetLed-response"
  "my_robot_msgs/SetLedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetLed-response>)))
  "Returns md5sum for a message object of type '<SetLed-response>"
  "a5cba455e6c34810630dc8f80babd86a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetLed-response)))
  "Returns md5sum for a message object of type 'SetLed-response"
  "a5cba455e6c34810630dc8f80babd86a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetLed-response>)))
  "Returns full string definition for message of type '<SetLed-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetLed-response)))
  "Returns full string definition for message of type 'SetLed-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetLed-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetLed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'SetLed-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'SetLed)))
  'SetLed-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'SetLed)))
  'SetLed-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetLed)))
  "Returns string type for a service object of type '<SetLed>"
  "my_robot_msgs/SetLed")