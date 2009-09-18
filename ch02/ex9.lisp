(defun summit (lst)
  ;; because remove is pure, and that's good like that :-)
  (apply #'+ (remove nil lst))) 


(defun summit2 (lst)
  ;; this extra if is need, otherwise there is an infine 
  ;; recursion with the first call to summit2
  (if (null lst)
      0
      (let ((x (car lst)))
	(if (null x)
	    (summit2 (cdr lst))
	    (+ x (summit2 (cdr lst)))))))

(summit '(1 2 3 4)) ;; 10
(summit nil) ;; 0
(summit '(1 2 nil 4)) ;; 7

