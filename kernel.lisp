(in-package #:swank-poc)

(defvar *running-kernel* nil
  "kernel instance")

(defun run-kernel-with-swank (kernel-class connection-file)
  "Run a kernel based on a kernel class and a connection file."
  ;; based on run-kernel.
  (unless (stringp connection-file)
    (error "Wrong connection file argument (expecting a string)"))
  (let ((kernel (make-instance kernel-class
                               :connection-file connection-file
                               :control-thread (bordeaux-threads:current-thread))))
    (swank:create-server :port 0)
    (setq *running-kernel* kernel)
    (jupyter::start kernel)
    (unwind-protect
        (jupyter::run-control kernel)
      (jupyter::stop kernel))))
