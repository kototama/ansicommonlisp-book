(defun gcons (e1 e2)
  (cons e2 e1))

(defun glist (elts)
  (if (null elts)
      nil
      (gcons (car elts) (glist (cdr elts)))))

(defun glength (lst)
  (if (null lst)
      0
      (+ 1 (glength (car lst)))))

(defun gmember (elt lst)
  (if (null lst)
      nil
      (if (eql elt (cdr lst))
	  (cdr lst)
	  (gmember elt (car lst)))))

(equal (car (gcons 'b nil)) (cdr (cons 'b nil))) ;; t
(equal (cdr (gcons 'b nil)) (car (cons 'b nil))) ;; t

(glist '(a b c d)) ;; ((((NIL . D) . C) . B) . A)

(glength (glist '(a b c d))) ;; 4

(gmember 'b (glist '(a b c d))) ;; b
(gmember 'o (glist '(a b c d))) ;; nil

