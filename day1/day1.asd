(defsystem "day1"
    :version "0"
    :depends-on (#:cffi)
    :components
    ((:file "generic")
     (:file "register" :depends-on ("generic"))
     (:file "main" :depends-on ("register"))))
