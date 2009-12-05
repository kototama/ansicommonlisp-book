(defun intersperse (e l)
  (do ((res nil)
       (cur l (cdr cur)))
      ((null cur) res)
    (setf res (append res 
                      (if (null (cdr cur))
                          (list (car cur))
                          (list (car cur) e))))))

   
(defun intersperse2 (e l)
  (intersperse2-acc e l nil))

(defun intersperse2-acc (e l res)
  (cond ((null l) res)
        ((null (cdr l)) (intersperse2-acc e (cdr l) (append res (list (car l)))))
        (t (intersperse2-acc e (cdr l) (append res (list (car l) e))))))
 
(intersperse '- '(a b c d)) ;; (A - B - C - D)
(intersperse2 '- '(a b c d)) ;; (A - B - C - D)
