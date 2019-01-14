;; Auto-generated. Do not edit!


(when (boundp 'my_robot_msgs::ComputeDiskArea)
  (if (not (find-package "MY_ROBOT_MSGS"))
    (make-package "MY_ROBOT_MSGS"))
  (shadow 'ComputeDiskArea (find-package "MY_ROBOT_MSGS")))
(unless (find-package "MY_ROBOT_MSGS::COMPUTEDISKAREA")
  (make-package "MY_ROBOT_MSGS::COMPUTEDISKAREA"))
(unless (find-package "MY_ROBOT_MSGS::COMPUTEDISKAREAREQUEST")
  (make-package "MY_ROBOT_MSGS::COMPUTEDISKAREAREQUEST"))
(unless (find-package "MY_ROBOT_MSGS::COMPUTEDISKAREARESPONSE")
  (make-package "MY_ROBOT_MSGS::COMPUTEDISKAREARESPONSE"))

(in-package "ROS")





(defclass my_robot_msgs::ComputeDiskAreaRequest
  :super ros::object
  :slots (_radius ))

(defmethod my_robot_msgs::ComputeDiskAreaRequest
  (:init
   (&key
    ((:radius __radius) 0.0)
    )
   (send-super :init)
   (setq _radius (float __radius))
   self)
  (:radius
   (&optional __radius)
   (if __radius (setq _radius __radius)) _radius)
  (:serialization-length
   ()
   (+
    ;; float64 _radius
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _radius
       (sys::poke _radius (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _radius
     (setq _radius (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass my_robot_msgs::ComputeDiskAreaResponse
  :super ros::object
  :slots (_area ))

(defmethod my_robot_msgs::ComputeDiskAreaResponse
  (:init
   (&key
    ((:area __area) 0.0)
    )
   (send-super :init)
   (setq _area (float __area))
   self)
  (:area
   (&optional __area)
   (if __area (setq _area __area)) _area)
  (:serialization-length
   ()
   (+
    ;; float64 _area
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _area
       (sys::poke _area (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _area
     (setq _area (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass my_robot_msgs::ComputeDiskArea
  :super ros::object
  :slots ())

(setf (get my_robot_msgs::ComputeDiskArea :md5sum-) "c314357897f85c5c2498418b07dbcead")
(setf (get my_robot_msgs::ComputeDiskArea :datatype-) "my_robot_msgs/ComputeDiskArea")
(setf (get my_robot_msgs::ComputeDiskArea :request) my_robot_msgs::ComputeDiskAreaRequest)
(setf (get my_robot_msgs::ComputeDiskArea :response) my_robot_msgs::ComputeDiskAreaResponse)

(defmethod my_robot_msgs::ComputeDiskAreaRequest
  (:response () (instance my_robot_msgs::ComputeDiskAreaResponse :init)))

(setf (get my_robot_msgs::ComputeDiskAreaRequest :md5sum-) "c314357897f85c5c2498418b07dbcead")
(setf (get my_robot_msgs::ComputeDiskAreaRequest :datatype-) "my_robot_msgs/ComputeDiskAreaRequest")
(setf (get my_robot_msgs::ComputeDiskAreaRequest :definition-)
      "float64 radius
---
float64 area
")

(setf (get my_robot_msgs::ComputeDiskAreaResponse :md5sum-) "c314357897f85c5c2498418b07dbcead")
(setf (get my_robot_msgs::ComputeDiskAreaResponse :datatype-) "my_robot_msgs/ComputeDiskAreaResponse")
(setf (get my_robot_msgs::ComputeDiskAreaResponse :definition-)
      "float64 radius
---
float64 area
")



(provide :my_robot_msgs/ComputeDiskArea "c314357897f85c5c2498418b07dbcead")


