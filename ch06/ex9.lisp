(defun oct-apply (fn arg &rest args)
  (let ((*print-base* 8))
    (apply #'apply fn arg args)))

;; (defun print-all (&rest lst)
;;   (dolist (obj lst)
;;     (format t "~a " obj)))

;; CL-USER> (oct-apply #'print-all 1 2 3 4 '(4 5 6 8 42))
;; 1 2 3 4 4 5 6 10 52 NIL
