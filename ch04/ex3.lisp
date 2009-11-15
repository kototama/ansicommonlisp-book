(defstruct ternary-tree elt l r m)

(defun deepcopy-ternary-tree (tree)
  (if (null tree)
      nil
      (make-ternary-tree
       :elt (ternary-tree-elt tree)
       :l (copy-ternary-tree (ternary-tree-l tree))
       :m (copy-ternary-tree (ternary-tree-m tree))
       :r (copy-ternary-tree (ternary-tree-r tree)))))

(defun find-ternary-tree (tree elt)
  (if (null tree)
      nil
      (if (eql elt (ternary-tree-elt tree))
          t
          (or (find-ternary-tree (ternary-tree-l tree) elt)
              (find-ternary-tree (ternary-tree-m tree) elt)
              (find-ternary-tree (ternary-tree-r tree) elt)))))
      
  
;;

(defparameter tree
  (make-ternary-tree
   :elt :a
   :l (make-ternary-tree :elt :al1)
   :m (make-ternary-tree :elt :am1
                        :l (make-ternary-tree :elt :al2)
                        :m (make-ternary-tree :elt :am2 :m (make-ternary-tree :elt :am3))
                        :r (make-ternary-tree :elt :ar2))
   :r (make-ternary-tree :elt :ar1 :r (make-ternary-tree :elt :ar2))))


(not (eql tree (deepcopy-ternary-tree tree)))

(eql nil (find-ternary-tree tree :ar3))
(eql t (find-ternary-tree tree :am3))
