(defpackage :main
  (:use :common-lisp :register))

(in-package :main)

(defun main ()
  (unless (gl-init)
    (return-from main nil))
  (let ((window (glfw-create-window 400 300 "day1" nil nil)))
    (loop while (not (glfw-window-should-close window)) do
	  (progn
	    (glfw-swap-buffers window)
	    (glfw-poll-events))))
  (gl-quit))

(main)
