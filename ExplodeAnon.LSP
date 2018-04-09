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

(defun c:explodeanon ( / ss qaf )
;;;This command explodes all anonymous blocks (a.k.a. "unnamed" blocks) in a 
;;;drawing. 
;;;
;;;If a block in the drawing has a name beginning with "*U", then it is exploded, 
;;;since all anonymous blocks begin with "*U" followed by a number.
  
  (setq qaf (getvar 'QAFLAGS))
  (setvar 'QAFLAGS 5)

  (if (setq ss (ssget "_X" '((0 . "INSERT") (2 . "`*U*")))) (command "_.explode" ss ""))
  
  (setvar 'QAFLAGS qaf)
  (princ)
)
