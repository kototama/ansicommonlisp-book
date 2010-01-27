(let ((last nil))
  (defun maxthanlast-p (x)
    (let ((p last))
      (setf last x)
      (when (not (null p))
        (> x p)))))

;; CL-USER> (maxthanlast-p 42)
;; NIL
;; CL-USER> (maxthanlast-p 43)
;; T
;; CL-USER> (maxthanlast-p 40)
;; NIL
;; CL-USER> (maxthanlast-p 41)
;; T