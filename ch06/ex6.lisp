(let ((max nil))
  (defun max-so-far (x)
    (if (or (null max) (> x max))
        (setf max x)
        max)))

;; CL-USER> (max-so-far 2)
;; 2
;; CL-USER> (max-so-far 22)

;; 22
;; CL-USER> (max-so-far 2)
;; 22