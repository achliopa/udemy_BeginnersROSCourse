
(cl:in-package :asdf)

(defsystem "my_robot2_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :actionlib_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "CountUntilAction" :depends-on ("_package_CountUntilAction"))
    (:file "_package_CountUntilAction" :depends-on ("_package"))
    (:file "CountUntilActionFeedback" :depends-on ("_package_CountUntilActionFeedback"))
    (:file "_package_CountUntilActionFeedback" :depends-on ("_package"))
    (:file "CountUntilActionGoal" :depends-on ("_package_CountUntilActionGoal"))
    (:file "_package_CountUntilActionGoal" :depends-on ("_package"))
    (:file "CountUntilActionResult" :depends-on ("_package_CountUntilActionResult"))
    (:file "_package_CountUntilActionResult" :depends-on ("_package"))
    (:file "CountUntilFeedback" :depends-on ("_package_CountUntilFeedback"))
    (:file "_package_CountUntilFeedback" :depends-on ("_package"))
    (:file "CountUntilGoal" :depends-on ("_package_CountUntilGoal"))
    (:file "_package_CountUntilGoal" :depends-on ("_package"))
    (:file "CountUntilResult" :depends-on ("_package_CountUntilResult"))
    (:file "_package_CountUntilResult" :depends-on ("_package"))
  ))