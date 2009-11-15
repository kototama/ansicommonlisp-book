(defun hashtable-from-alist (alist)
  (let ((ht (make-hash-table)))
    (dolist (x alist)
      (setf (gethash (car x) ht) (cdr x)))
    ht))

(defun alist-from-hashtable (ht)
  (let ((alist nil))
    (maphash (lambda (k v) (push (cons k v) alist)) ht)
    alist))
;;

(defparameter alist '((+ . "add") (- . "substract")))
(defparameter h (hashtable-from-alist alist))

(equal (gethash '+ h) "add")
(equal  (gethash '- h) "substract")

(equal (gethash '+ (hashtable-from-alist (alist-from-hashtable h))) "add")
(equal (gethash '- (hashtable-from-alist (alist-from-hashtable h))) "substract")


