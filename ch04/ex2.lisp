(defun my-copylist (l)
  (reduce (lambda (acc x) (append acc (list x))) l :initial-value nil))

(defun my-reverse (l)
  (reduce (lambda (acc x) (cons x acc)) l :initial-value nil))


(equal (my-copylist '(a b c d e)) '(a b c d e))
(not (eql (my-copylist '(a b c d e)) '(a b c d e)))

(equal (my-reverse '(a b c d e)) '(e d c b a))

