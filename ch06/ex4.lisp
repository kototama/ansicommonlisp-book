(defun most (fn lst)
  (if (null lst)
      (values nil nil)
      (let* ((max (funcall fn (car lst)))
             (max2 (funcall fn (cadr lst))))
        (dolist (obj (cddr lst))
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

(most #'identity '(-3))
;; -3
;; NIL

(most #'identity '(6 5))
;; 6
;; 5

(most #'identity '(-41 -42))
;; -41
;; -42


(most #'identity '(1 2 3 4 5 6))
;; 6
;; 5

(most #'identity '(-1 -2 -3 -4 -5 -6))
;; -1
;; -2
