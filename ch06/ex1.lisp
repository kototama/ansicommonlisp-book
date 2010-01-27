(defun tokens (str &key (test 'constituent) (start 0))
  (let ((p1 (position-if test str :start start)))
    (if p1
        (let ((p2 (position-if #'(lambda (c) 
                                   (not (funcall test c)))
                               str :start p1)))
          (cons (subseq str p1 p2)
                (if p2 
                    (tokens str :test test :start p2) 
                    nil)))
        nil)))

(defun constituent (c)
  (and (graphic-char-p c)
       (not (char= c #\  ))))

(tokens "ab12 3cde.f" :test #'alpha-char-p :start 0) ;; ("ab" "cde" "f")
(tokens "ab12 3cde.f
 gh" :test #'constituent :start 0) ;; ("ab12" "3cde.f" "gh")

(tokens "ab12 3cde.f
 gh") ;; ("ab12" "3cde.f" "gh")

