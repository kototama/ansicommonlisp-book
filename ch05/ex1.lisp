(do ((x (car y))) 
    (t (cons x x)))

(do* ((w (car x))
      (y (+ w z)))
     (t (cons w y)))

