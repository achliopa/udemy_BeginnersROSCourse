; Auto-generated. Do not edit!


(cl:in-package my_robot_msgs-srv)


;//! \htmlinclude ComputeDiskArea-request.msg.html

(cl:defclass <ComputeDiskArea-request> (roslisp-msg-protocol:ros-message)
  ((radius
    :reader radius
    :initarg :radius
    :type cl:float
    :initform 0.0))
)

(cl:defclass ComputeDiskArea-request (<ComputeDiskArea-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ComputeDiskArea-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ComputeDiskArea-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_robot_msgs-srv:<ComputeDiskArea-request> is deprecated: use my_robot_msgs-srv:ComputeDiskArea-request instead.")))

(cl:ensure-generic-function 'radius-val :lambda-list '(m))
(cl:defmethod radius-val ((m <ComputeDiskArea-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_robot_msgs-srv:radius-val is deprecated.  Use my_robot_msgs-srv:radius instead.")
  (radius m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ComputeDiskArea-request>) ostream)
  "Serializes a message object of type '<ComputeDiskArea-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'radius))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ComputeDiskArea-request>) istream)
  "Deserializes a message object of type '<ComputeDiskArea-request>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'radius) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ComputeDiskArea-request>)))
  "Returns string type for a service object of type '<ComputeDiskArea-request>"
  "my_robot_msgs/ComputeDiskAreaRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ComputeDiskArea-request)))
  "Returns string type for a service object of type 'ComputeDiskArea-request"
  "my_robot_msgs/ComputeDiskAreaRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ComputeDiskArea-request>)))
  "Returns md5sum for a message object of type '<ComputeDiskArea-request>"
  "c314357897f85c5c2498418b07dbcead")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ComputeDiskArea-request)))
  "Returns md5sum for a message object of type 'ComputeDiskArea-request"
  "c314357897f85c5c2498418b07dbcead")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ComputeDiskArea-request>)))
  "Returns full string definition for message of type '<ComputeDiskArea-request>"
  (cl:format cl:nil "float64 radius~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ComputeDiskArea-request)))
  "Returns full string definition for message of type 'ComputeDiskArea-request"
  (cl:format cl:nil "float64 radius~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ComputeDiskArea-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ComputeDiskArea-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ComputeDiskArea-request
    (cl:cons ':radius (radius msg))
))
;//! \htmlinclude ComputeDiskArea-response.msg.html

(cl:defclass <ComputeDiskArea-response> (roslisp-msg-protocol:ros-message)
  ((area
    :reader area
    :initarg :area
    :type cl:float
    :initform 0.0))
)

(cl:defclass ComputeDiskArea-response (<ComputeDiskArea-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ComputeDiskArea-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ComputeDiskArea-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_robot_msgs-srv:<ComputeDiskArea-response> is deprecated: use my_robot_msgs-srv:ComputeDiskArea-response instead.")))

(cl:ensure-generic-function 'area-val :lambda-list '(m))
(cl:defmethod area-val ((m <ComputeDiskArea-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_robot_msgs-srv:area-val is deprecated.  Use my_robot_msgs-srv:area instead.")
  (area m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ComputeDiskArea-response>) ostream)
  "Serializes a message object of type '<ComputeDiskArea-response>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'area))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ComputeDiskArea-response>) istream)
  "Deserializes a message object of type '<ComputeDiskArea-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'area) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ComputeDiskArea-response>)))
  "Returns string type for a service object of type '<ComputeDiskArea-response>"
  "my_robot_msgs/ComputeDiskAreaResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ComputeDiskArea-response)))
  "Returns string type for a service object of type 'ComputeDiskArea-response"
  "my_robot_msgs/ComputeDiskAreaResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ComputeDiskArea-response>)))
  "Returns md5sum for a message object of type '<ComputeDiskArea-response>"
  "c314357897f85c5c2498418b07dbcead")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ComputeDiskArea-response)))
  "Returns md5sum for a message object of type 'ComputeDiskArea-response"
  "c314357897f85c5c2498418b07dbcead")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ComputeDiskArea-response>)))
  "Returns full string definition for message of type '<ComputeDiskArea-response>"
  (cl:format cl:nil "float64 area~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ComputeDiskArea-response)))
  "Returns full string definition for message of type 'ComputeDiskArea-response"
  (cl:format cl:nil "float64 area~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ComputeDiskArea-response>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ComputeDiskArea-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ComputeDiskArea-response
    (cl:cons ':area (area msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ComputeDiskArea)))
  'ComputeDiskArea-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ComputeDiskArea)))
  'ComputeDiskArea-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ComputeDiskArea)))
  "Returns string type for a service object of type '<ComputeDiskArea>"
  "my_robot_msgs/ComputeDiskArea")