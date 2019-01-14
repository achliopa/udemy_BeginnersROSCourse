
(cl:in-package :asdf)

(defsystem "my_robot_msgs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ComputeDiskArea" :depends-on ("_package_ComputeDiskArea"))
    (:file "_package_ComputeDiskArea" :depends-on ("_package"))
    (:file "SetLed" :depends-on ("_package_SetLed"))
    (:file "_package_SetLed" :depends-on ("_package"))
  ))