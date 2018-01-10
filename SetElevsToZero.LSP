(defun c:allelevzero ( / e i p s )
;;;This function sets the elevation of all blocks in a drawing to 0.0
  (if (setq s (ssget "_X" '((0 . "INSERT") (-4 . "*,*,<>") (10 0.0 0.0 0.0))))
    (repeat (setq i (sslength s))
      (setq e (entget (ssname s (setq i (1- i)))) p (assoc 10 e))
    (entmod (subst (list 10 (cadr p) (caddr p) 0.0) p e))
    )
  )
  (princ)
)