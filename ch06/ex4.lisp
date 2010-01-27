(defun most (fn lst)
  (if (null lst)
      (values nil nil)
      (let* ((max (funcall fn (car lst)))
             (max2 max))
        (dolist (obj (cdr lst))
          (let ((score (funcall fn obj)))
            (if (> score max)
                (setf max2 max
                      max score)
                (if (> score max2)
                    (setf max2 score)))))
        (values max max2))))


(most #'length '((a b) (a b c) (a b c d)))
;; 4
;; 3