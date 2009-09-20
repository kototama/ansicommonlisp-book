(defun pos+_iter (lst)
  (do ((pos 0 (+ pos 1))       
       (res nil)
       (nxt lst (cdr nxt)))
      ((null nxt) (reverse res))
    (push (+ pos (car nxt)) res)))

(defun pos+_rec (lst)
  (pos+_recacc lst 0))

(defun pos+_recacc (lst acc)
  (if (null lst)
      nil
      (cons (+ acc (car lst))
	    (pos+_recacc (cdr lst) (+ acc 1)))))

(defun pos+_map (lst)
  (let ((pos 0))
    (mapcar (lambda (x) 
	      (let ((cur pos)) (setf pos (+ pos 1)) (+ cur x))) 
	    lst)))
      
(pos+_iter '(7 5 1 4)) ;; (7 6 3 7)

(pos+_rec '(7 5 1 4)) ;; (7 6 3 7)

(pos+_map '(7 5 1 4)) ;; (7 6 3 7)
