(defsystem :jupyter-swank-kernel-poc
  :depends-on (:common-lisp-jupyter :swank)
  :serial t
  :components ((:file "package")
	       (:file "kernel")
	       ))
