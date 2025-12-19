<div align="center">
<img src="d:\PROLOG\Logo-TecNM.png" width="290" height="90" alt="Tec Morelia Logo">
<img src="d:\PROLOG\136706.png" width="120" alt="Tec Morelia Logo">


---

# INSTITUTO TECNOLÓGICO DE MORELIA  

## Division con metodo recursivo clisp

### Ingeniería en Sistemas Computacionales
### Programación Lógica y Funcional


---

### Integrante | N.C.:
**Monica Nayeli Rodriguez Peña** | **21121564**

---

**Profesor:** Alcaraz Chavez Jesus Eduardo

---

MORELIA, MICHOACÁN  
**Sep 2025**

</div>


<div>

<h1>Introduccion</h1> 
En esta practica como objetivo se analizara el metodo recursivo para obtener el resultado de una division dado por una secuencia de restas hasta obtener un valor del dividendo mayor al divisior concluyendo el ciclo e imprimiendo un resultado al usuario

</div>

<div align=center>
<h1>Desarrollo</h1>

En este código en Common Lisp se implementa un método recursivo para realizar una división entera (sin decimales). El programa solicita al usuario ingresar un divisor y un dividendo, y luego utiliza la función metodo-recursivo, la cual resta sucesivamente el divisor al dividendo hasta que el dividendo sea menor que el divisor. Cada resta cuenta como una unidad en el resultado. De esta forma se obtiene el cociente entero de la división.
</div>

<h1>Clisp</h1>

```lisp
(defun metodo-recursivo (divisor dividendo)
  (if (< dividendo divisor)
      0
      (+ 1 (metodo-recursivo divisor (- dividendo divisor)))
   )
)

(defun inicio ()
  (format t "Ingrese el divisor: ")
  (let ((divisor (read)))
    (format t "Ingrese el dividendo: ")
    (let ((dividendo (read)))
      (let ((resultado (metodo-recursivo divisor dividendo)))
        (format t "El resultado de la division es: ~a" resultado)))
  )
)

(inicio)

```


<h1>Python</h1>

```python
def metodo_recursivo(divisor, dividendo):
    if dividendo < divisor:
        return 0
    else:
        return 1 + metodo_recursivo(divisor, dividendo - divisor)
    

def main():
    divisor = int(input("Ingrese el divisor: "))
    dividendo = int(input("Ingrese el dividendo: "))
    resultado = metodo_recursivo(divisor, dividendo)
    print(f"El resultado de la división es: {resultado}")
   

if _name_ == "_main_":
    main()
```
