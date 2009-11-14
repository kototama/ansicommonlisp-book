(defun quarter-turn (m)
  (let ((dim (car (array-dimensions m))))
    (do ((arr (make-array (list dim dim) :initial-element nil))
         (i 0 (+ i 1)))
        ((= i dim) arr)
      (do ((j 0 (+ j 1)))
          ((= j dim) nil)
        (let ((l (- (- dim 1) i)))
          (setf (aref arr j l) (aref m i j)))))))

(quarter-turn #2a((A B) (C D))) ;; #2A((C A) (D B))

(quarter-turn #2a((A B C) (D E F) (G H I))) ;; #2A((G D A) (H E B) (I F C))

