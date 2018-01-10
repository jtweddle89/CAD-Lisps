(defun c:explodeanon ( / ss qaf )
;;;This function explodes all anonymous blocks in a drawing.
;;;If a block in the drawing has a name beginning with "*U", then it is exploded.
  
  (setq qaf (getvar 'QAFLAGS))
  (setvar 'QAFLAGS 5)

  (if (setq ss (ssget "_X" '((0 . "INSERT") (2 . "`*U*")))) (command "_.explode" ss ""))
  
  (setvar 'QAFLAGS qaf)
  (princ)
)
