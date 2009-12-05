(defun iscontinuous (x y)
  (= (abs (- x y)) 1))

(defun continuous-pairsp (l)
  (if (null l)
      t
      (let ((e (car l))
            (e2 (cadr l)))
        (and (iscontinuous e e2) (continuous-pairsp (cddr l))))))

(defun continuous-pairsp-do (l)
  (do ((curl l (cddr curl))
       (e (car l) (car curl))
       (e2 (cadr l) (cadr curl)))
      ((null curl) (iscontinuous e e2))
    (when (not (iscontinuous e e2))
        (return))))

(defun continuous-pairsp-mapc (l)
  (let ((relevant t))
    (mapc (lambda (x y)
            (if (and relevant (not (iscontinuous x y)))
                (return-from continuous-pairsp-mapc)
                (setf relevant (not relevant))))
          l (cdr l))
    t))


(continuous-pairsp '(1 2 43 44 45 47)) ;; NIL
(continuous-pairsp '(1 2 43 44)) ;; t

(continuous-pairsp-do '(1 2 43 44 46 47)) ;; t
(continuous-pairsp-do '(1 2 43 44 40 47)) ;; NIL
(continuous-pairsp-do '(1 2 40 44 46 47)) ;; NIL

(continuous-pairsp-mapc '(1 2 43 44 46 47)) ;; t
(continuous-pairsp-mapc '(1 2 43 44 40 47)) ;; NIL
(continuous-pairsp-mapc '(1 2 40 44 46 47)) ;; NIL
