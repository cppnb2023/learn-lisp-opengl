(defpackage :register
  (:use :common-lisp :cffi :generic)
  (:export
   :gl-init
   :gl-quit
   :glfw-create-window
   :glfw-swap-buffers
   :glfw-poll-events
   :glfw-window-should-close))

(in-package :register)

(define-foreign-library libgl
    (:unix (:default "libGL")))

(define-foreign-library libglfw
    (:unix (:default "libglfw")))

(define-foreign-library libmy
    (:unix (:default "libmy")
		    :search-path "./"))

(use-foreign-library libgl)
(use-foreign-library libglfw)
(use-foreign-library libmy)

(defctype glfw-window-ptr :pointer)

(defcfun ("glInit" %gl-init) :int)
(defcfun ("glQuit" %gl-quit) :void)

(defcfun ("glfwCreateWindow" %glfw-create-window) glfw-window-ptr
  (width :int) (height :int) (title :string) (monitor glfw-window-ptr)
  (share glfw-window-ptr))
(defcfun ("glfwSwapBuffers" glfw-swap-buffers) :void
  (window glfw-window-ptr))
(defcfun ("glfwPollEvents" glfw-poll-events) :void)
(defcfun ("glfwWindowShouldClose" %glfw-window-should-close)
    :int (window glfw-window-ptr))

(defun gl-init ()
  (c-if (%gl-init)
	(progn
	  (format t "gl-init exec failed~%")
	  nil)
	(progn
	  (format t "gl-init exec finish~%")
	  t)))

(defun gl-quit()
  (%gl-quit))

(defun glfw-create-window (width height title monitor share)
  (with-foreign-string (title-string title)
    (let ((monitor (if monitor monitor (null-pointer)))
	  (share (if share share (null-pointer))))
      (%glfw-create-window width height title-string monitor share))))

(defun glfw-window-should-close (window)
  (/= (%glfw-window-should-close window) 0))
