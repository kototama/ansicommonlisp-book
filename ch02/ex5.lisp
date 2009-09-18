(defun enigma (x)
  "Return t if an element of the list x is nil, nil otherwise"
  (and (not (null x))
       (or (null (car x))
	   (enigma (cdr x)))))

(defun mystery (x y) 
  "Return the first position of the element x in the list, 
  or nil it does not exist"
  (if (null y)	
      nil
      (if (eql (car y) x)
	  0
	  (let ((z (mystery x (cdr y))))
	    (and z (+ z 1))))))


(enigma '(a nil c)) ;; t
(enigma '(a d c)) ;; nil
(enigma '(a (a nil) c)) ;; nil

(mystery 'a '( b c d a e)) ;; 3
(mystery 'a '( b c d e e)) ;; nil
