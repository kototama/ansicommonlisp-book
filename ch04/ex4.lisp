(load "bst.lisp")

(defun bst-orderedlist (bst)
  (let ((elts nil))
    (bst-traverse (lambda (x) (push x elts)) bst)
    (sort elts #'>)))


;;
(defparameter nums nil)
(dolist (x '(5 8 4 2 1 9 6 7 3))
  (setf nums (bst-insert x nums #'<)))

(equal (bst-orderedlist nums) '(9 8 7 6 5 4 3 2 1))
