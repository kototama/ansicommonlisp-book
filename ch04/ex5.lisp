(defun bst-adjoin (elt bst <)
  (if (bst-find elt bst <)
      bst
      (bst-insert elt bst <)))

(defparameter nums nil)
(dolist (x '(5 8 4 2 1 9 6 7 3))
  (setf nums (bst-insert x nums #'<)))

(eql nums (bst-adjoin 5 nums #'<))
(not (eql (bst-adjoin 42 nums #'<) nums))

