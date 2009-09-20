(defun new-union (l m)
  (let ((res nil))
    (dolist (item l)
      (pushnew item res))
    (dolist (item m)
      (pushnew item res))
    (reverse res)))

(new-union '(a b c) '(b a d)) ;; (a b c d)
