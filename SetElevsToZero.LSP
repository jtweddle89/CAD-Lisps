;;;MIT License
;;;
;;;Copyright (c) 2018 Jared Tweddle
;;;
;;;Permission is hereby granted, free of charge, to any person obtaining a copy
;;;of this software and associated documentation files (the "Software"), to deal
;;;in the Software without restriction, including without limitation the rights
;;;to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
;;;copies of the Software, and to permit persons to whom the Software is
;;;furnished to do so, subject to the following conditions:
;;;
;;;The above copyright notice and this permission notice shall be included in all
;;;copies or substantial portions of the Software.
;;;
;;;THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
;;;IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
;;;FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
;;;AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
;;;LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
;;;OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;;;SOFTWARE.

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
