(defstruct buf
  vec (start -1) (used -1) (new -1) (end -1))

(defun bref (buf n)
  (svref (buf-vec buf)
         (mod n (length (buf-vec buf)))))

(defun (setf bref) (val buf n)
  (setf (svref (buf-vec buf)
               (mod n (length (buf-vec buf))))
        val))

(defun new-buf (len)
  (make-buf :vec (make-array len)))

(defun buf-insert (x b)
  (setf (bref b (incf (buf-end b))) x))

(defun buf-pop (b)
  (prog1 
    (bref b (incf (buf-start b)))
    (setf (buf-used b) (buf-start b)
          (buf-new  b) (buf-end   b))))

(defun buf-next (b)
  (when (< (buf-used b) (buf-new b))
    (bref b (incf (buf-used b)))))

(defun buf-reset (b)
  (setf (buf-used b) (buf-start b)
        (buf-new  b) (buf-end   b)))

(defun buf-clear (b)
  (setf (buf-start b) -1 (buf-used  b) -1
        (buf-new   b) -1 (buf-end   b) -1))

(defun buf-flush (b str)
  (do ((i (1+ (buf-used b)) (1+ i)))
      ((> i (buf-end b)))
    (princ (bref b i) str)))

(defun file-subst (old new file1 file2)
  (with-open-file (in file1 :direction :input)
     (with-open-file (out file2 :direction :output
                                :if-exists :supersede)
       (stream-subst old new in out))))

(defun matchp (encountered expected special)
  (if special
      (ecase expected
        (#\$ (digit-char-p encountered))
        (#\% (alphanumericp encountered))
        (#\+ t))
      (char= encountered expected)))

;; Patterns are:
;;
;; $ = any digit
;; % = alphanumeric
;; + = any character

;; We make it simple : old is a list that contains
;; the characters to match. Each character is followed
;; by either t or nil. t means to evaluate the character
;; as a pattern character ($, %, +). nil means to
;; evaluate the character as a litteral character
;;
;; Thus (#\a nil #\+ nil) will match the string "a+"
;; while (#\a nil #\+ t) will match the string "ab", "ac", "a1" "a_" etc.
;;
;; Indeed there is a possibility of keeping old as a string
;; (contrary to what the hint say) but then we would need
;; to provide a mean to escape characters
;; like with Perl-style regular expressions

(defun stream-subst (old new in out)
  (let* ((pos 0)
         (len (length old))
         (buf (new-buf len))
         (from-buf nil))
    (do ((c (read-char in nil :eof)
            (or (setf from-buf (buf-next buf))
                (read-char in nil :eof))))
        ((eql c :eof))
      (cond ((matchp c (nth pos old) (nth (1+ pos) old))
             (setf pos (+ pos 2))
             (cond ((= pos len)            ; 3
                    (princ new out)
                    (setf pos 0)
                    (buf-clear buf))
                   ((not from-buf)         ; 2
                    (buf-insert c buf))))
            ((zerop pos)                   ; 1
             (princ c out)
             (when from-buf
               (buf-pop buf)
               (buf-reset buf)))
            (t                             ; 4
             (unless from-buf
               (buf-insert c buf))
             (princ (buf-pop buf) out)
             (buf-reset buf)
             (setf pos 0))))
    (buf-flush buf out)))

;; CL-USER> (file-subst '(#\a nil #\+ nil  #\b nil) "ABC" "test6.txt" "test6out.txt")
;; NIL
;; CL-USER> (file-subst '(#\a nil #\% t  #\b nil) "ABC" "test6.txt" "test6out.txt")
;; NIL
;; CL-USER> (file-subst '(#\a nil #\% t  #\b nil) "ABC" "test6.txt" "test6out.txt")
;; NIL
;; CL-USER> (file-subst '(#\a nil #\$ t  #\b nil) "ABC" "test6.txt" "test6out.txt")
;; NIL