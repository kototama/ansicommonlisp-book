(defun longest-path (start end net)
  (let ((paths (dfs end (list start) net)))
    (reverse (car (sort paths (lambda (x y) (> (length x) (length y))))))))

(defun dfs (end path net)
  "Depth-first search. Return all possible paths that go to element end"
  (if (eql end (car path))
      (list path)
      (let ((paths nil))
	(let ((children (cdr (assoc (car path) net))))
	  (dolist (child children)
	    (if (null (member child path))
		;; not already visited
		(let ((res (dfs end (cons child path) net)))
		  (setf paths (append paths res)))))
	  paths))))

(longest-path 'a 'd '((a b c) (b c) (c d))) ;; (A B C D)
(longest-path 'a 'd '((a b c) (b a c) (c d)));; (A B C D)
(longest-path 'a 'e '((a b f) (b c) (c d) (d b e) (f e))) ;; (A B C D E)
