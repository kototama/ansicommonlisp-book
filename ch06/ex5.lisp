(defun filter (fn lst)
  (let ((acc nil))
    (dolist (x lst)
      (let ((val (funcall fn x)))
        (if val (push val acc))))
    (nreverse acc)))

(defun our-remove-if (fn lst)
  (filter (lambda (x) (when (not (funcall fn x)) x)) lst))

;; CL-USER> (our-remove-if #'oddp '(1 2 3 4))
;; (2 4)
;; CL-USER> (remove-if #'oddp '(1 2 3 4))
;; (2 4)
