(defun find-path (start end net)
  (catch 'path-found
    (fp end (list (list start)) net)))

(defun fp (end queue net)
  (if (null queue)
      nil
      (let ((path (car queue)))
        (let ((node (car path)))
          (if (eql node end)
              (throw 'path-found (reverse path))
              (fp end
                  (append (cdr queue)
                          (new-paths path node net))
                  net))))))

(defun new-paths (path node net)
  (mapcar #'(lambda (n)
              (cons n path))
          (cdr (assoc node net))))

;; rewrite

(defun find-path2 (start end net)
  (fp2 end (list (list start)) net))

;; not sure about this one
(defun fp2 (end queue net)
  (if (null queue)
      nil
      (let ((path (car queue)))
        (let ((node (car path)))
          (if (eql node end)
              (return-from fp2 (reverse path))
              (fp2 end
                  (append (cdr queue)
                          (new-paths path node net))
                  net))))))

(defparameter net '((a b c) (b c) (c d)))

(find-path 'a 'd net)

;; without throw:

;; CL-USER> (trace fp)
;; (FP)
;; CL-USER> 
;; (find-path 'a 'd net)
;;   0: (FP D ((A)) ((A B C) (B C) (C D)))
;;     1: (FP D ((B A) (C A)) ((A B C) (B C) (C D)))
;;       2: (FP D ((C A) (C B A)) ((A B C) (B C) (C D)))
;;         3: (FP D ((C B A) (D C A)) ((A B C) (B C) (C D)))
;;           4: (FP D ((D C A) (D C B A)) ((A B C) (B C) (C D)))
;;           4: FP returned (A C D)
;;         3: FP returned (A C D)
;;       2: FP returned (A C D)
;;     1: FP returned (A C D)
;;   0: FP returned (A C D)

;; with throw

;; CL-USER> 
;; (find-path 'a 'd net)
;;   0: (FP D ((A)) ((A B C) (B C) (C D)))
;;     1: (FP D ((B A) (C A)) ((A B C) (B C) (C D)))
;;       2: (FP D ((C A) (C B A)) ((A B C) (B C) (C D)))
;;         3: (FP D ((C B A) (D C A)) ((A B C) (B C) (C D)))
;;           4: (FP D ((D C A) (D C B A)) ((A B C) (B C) (C D)))
;; (A C D)
;; CL-USER> 
