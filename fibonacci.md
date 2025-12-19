<div align="center">
<img src="d:\PROLOG\Logo-TecNM.png" width="290" height="90" alt="Tec Morelia Logo">
<img src="d:\PROLOG\136706.png" width="120" alt="Tec Morelia Logo">


---

# INSTITUTO TECNOLÓGICO DE MORELIA  

## Sucessión de Fibonacci

### Ingeniería en Sistemas Computacionales
### Programación Lógica y Funcional


---

### Integrante | N.C.:
**MONICA NAYELI RODRIGUEZ PEÑA** | **21121564**

---

**Profesor:** Alcaraz Chavez Jesus Eduardo

---

MORELIA, MICHOACÁN  
**Sep 2025**

</div>


<div>

<h1>Origen e importancia historica</h1> 
La sucesión de Fibonacci es una secuencia matemática infinita descrita por primera vez por Leonardo de Pisa, conocido como Fibonacci, en su libro Liber Abaci en 1202. Esta sucesión ha capturado la atención de matemáticos, científicos y artistas durante siglos debido a sus propiedades únicas y su aparición en diversos fenómenos naturales.

</div>

```lisp
(defun fibonacci (n)
  
  (cond
    ((= n 0) 0)
    ((= n 1) 1)
    (t (+ (fibonacci (- n 1))
          (fibonacci (- n 2))))))

(defun main ()
  
  (format t "¿Cuántos números de Fibonacci quieres generar? ")
  (let ((n (read)))
    (if (and (integerp n) (>= n 0))
        (progn
          (format t "~%~%Serie de Fibonacci (~a números):~%~%" n)
          (dotimes (i n)
            (format t "F(~a) = ~a~%" i (fibonacci i))))
        (format t "~%Error: Debes introducir un número ~%"))))

(main)