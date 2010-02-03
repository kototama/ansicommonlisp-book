(let ((last nil))
  (defun greaterthanlast-p (x)
    (let ((p last))
      (setf last x)
      (when (not (null p))
        (> x p)))))

;; CL-USER> (greaterthanlast-p 42)
;; NIL
;; CL-USER> (greaterthanlast-p 43)
;; T
;; CL-USER> (greaterthanlast-p 40)
;; NIL
;; CL-USER> (greaterthanlast-p 41)
;; T