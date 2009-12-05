(defun mystery (x y)
  "Return the first position of the element x in the list, 
  or nil if it does not exist"
  (if (null y)
      nil
      (if (eql (car y) x)
	  0
	  (let ((z (mystery x (cdr y))))
	    (and z (+ z 1))))))

(defun mystery2 (x y)
  "Return the first position of the element x in the list, 
  or nil if it does not exist"
  (cond ((null y) nil)
        ((eql (car y) x) 0)
        (t (let ((z (mystery2 x (cdr y))))
             (and z (+ z 1))))))


(eql (mystery2 'a '( b c d a e)) (mystery 'a '( b c d a e)))
(eql (mystery2 'a '( b c d e e)) (mystery 'a '( b c d e e)))

