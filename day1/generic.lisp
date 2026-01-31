(defpackage :generic
  (:use :common-lisp)
  (:export
   :c-if
   :c-when
   :c-unless))

(in-package :generic)

(defmacro c-if (expr then else)
  `(if (/= ,expr 0)
       ,then
       ,else))

(defmacro c-when (expr &body then)
  `(c-if ,expr (progn ,@then) nil))

(defmacro c-unless (expr &body else)
  `(c-if ,expr nil (progn ,@else)))
