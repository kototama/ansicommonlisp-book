(defconstant month #(0 31 59 90 120 151 181 212 243 273 304 334 365))

(defun leap? (y)
  (and (zerop (mod y 4))
       (or (zerop (mod y 400))
           (not (zerop (mod y 100))))))

(defun month-num (m y)
  (+ (svref month (- m 1))
     (if (and (> m 2) (leap? y)) 1 0)))


(defun month-num2 (m y)
  (+ (case m
       (1 0)
       (2 31)
       (3 59)
       (4 90)
       (5 120)
       (6 151)
       (7 181)
       (8 212)
       (9 243)
       (10 273)
       (11 304)
       (12 334)
       (otherwise (error "invalid value")))
     (if (and (> m 2) (leap? y)) 1 0)))



(eql (month-num2 1 2000) (month-num 1 2000))
(eql (month-num2 12 2004) (month-num 12 2004))
