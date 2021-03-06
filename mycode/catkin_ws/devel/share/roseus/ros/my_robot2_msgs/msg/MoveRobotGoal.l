;; Auto-generated. Do not edit!


(when (boundp 'my_robot2_msgs::MoveRobotGoal)
  (if (not (find-package "MY_ROBOT2_MSGS"))
    (make-package "MY_ROBOT2_MSGS"))
  (shadow 'MoveRobotGoal (find-package "MY_ROBOT2_MSGS")))
(unless (find-package "MY_ROBOT2_MSGS::MOVEROBOTGOAL")
  (make-package "MY_ROBOT2_MSGS::MOVEROBOTGOAL"))

(in-package "ROS")
;;//! \htmlinclude MoveRobotGoal.msg.html


(defclass my_robot2_msgs::MoveRobotGoal
  :super ros::object
  :slots (_position _velocity ))

(defmethod my_robot2_msgs::MoveRobotGoal
  (:init
   (&key
    ((:position __position) 0)
    ((:velocity __velocity) 0)
    )
   (send-super :init)
   (setq _position (round __position))
   (setq _velocity (round __velocity))
   self)
  (:position
   (&optional __position)
   (if __position (setq _position __position)) _position)
  (:velocity
   (&optional __velocity)
   (if __velocity (setq _velocity __velocity)) _velocity)
  (:serialization-length
   ()
   (+
    ;; int64 _position
    8
    ;; int64 _velocity
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _position
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _position (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _position) (= (length (_position . bv)) 2)) ;; bignum
              (write-long (ash (elt (_position . bv) 0) 0) s)
              (write-long (ash (elt (_position . bv) 1) -1) s))
             ((and (class _position) (= (length (_position . bv)) 1)) ;; big1
              (write-long (elt (_position . bv) 0) s)
              (write-long (if (>= _position 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _position s)(write-long (if (>= _position 0) 0 #xffffffff) s)))
     ;; int64 _velocity
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _velocity (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _velocity) (= (length (_velocity . bv)) 2)) ;; bignum
              (write-long (ash (elt (_velocity . bv) 0) 0) s)
              (write-long (ash (elt (_velocity . bv) 1) -1) s))
             ((and (class _velocity) (= (length (_velocity . bv)) 1)) ;; big1
              (write-long (elt (_velocity . bv) 0) s)
              (write-long (if (>= _velocity 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _velocity s)(write-long (if (>= _velocity 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _position
#+(or :alpha :irix6 :x86_64)
      (setf _position (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _position (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _velocity
#+(or :alpha :irix6 :x86_64)
      (setf _velocity (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _velocity (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get my_robot2_msgs::MoveRobotGoal :md5sum-) "94edb56bed3ad41c3ae8fb360e37e933")
(setf (get my_robot2_msgs::MoveRobotGoal :datatype-) "my_robot2_msgs/MoveRobotGoal")
(setf (get my_robot2_msgs::MoveRobotGoal :definition-)
      "# ====== DO NOT MODIFY! AUTOGENERATED FROM AN ACTION DEFINITION ======
#goal
int64 position # m
int64 velocity # m/s

")



(provide :my_robot2_msgs/MoveRobotGoal "94edb56bed3ad41c3ae8fb360e37e933")


