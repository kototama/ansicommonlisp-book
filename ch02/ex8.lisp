(defun print-dots-it (n)
  (do ((i 0 (+ i 1)))
      ((>= i n) (format t "~%"))
    (format t ".")))

(defun print-dots (n)
  (if (> n 0)
      (progn
	(format t ".")
	(print-dots (- n 1)))
      (format t "~%")))

(defun count-a-it (l)
  (let ((nb-a 0))
    (dolist (x l)
      (if (eql x 'a)
	  (setf nb-a (+ nb-a 1))))
    nb-a))

(defun count-a (l)
  (if (null l)
      0
      (if (eql (car l) 'a)
	  (+ 1 (count-a (cdr l)))
	  (count-a (cdr l)))))

(count-a-it nil) ;; 0
(count-a-it '(a a a)) ;; 3
(count-a-it '(oo ll ee)) ;; 0
