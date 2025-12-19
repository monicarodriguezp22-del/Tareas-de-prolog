<div align="center">
<img src="./imgs/logos/tec_mexico.png" width="290" height="90" alt="Tec Morelia Logo">
<img src="./imgs/logos/tec_morelia.png" width="120" alt="Tec Morelia Logo">


---

# INSTITUTO TECNOLÓGICO DE MORELIA  

## Multiplicación con metodo recursivo clisp

### Ingeniería en Sistemas Computacionales
### Programación Lógica y Funcional


---

### Integrante | N.C.:
**monica Nayeli Rodriguez Peña** | **21121564**

---

**Profesor:** Alcaraz Chavez Jesus Eduardo

---

MORELIA, MICHOACÁN  
**Sep 2025**

</div>


<div>

<h1>Introduccion</h1> 
En esta practica como objetivo se analizara el metodo recursivo para obtener el resultado de una multiplicacion dado por una secuencia de sumas repetidas hasta obtener el valor final concluyendo el ciclo e imprimiendo un resultado al usuario

</div>

<div align=center>
<h1>Desarrollo</h1>

En este código en Common Lisp se implementa un método recursivo para realizar una multiplicación entera. El programa solicita al usuario ingresar dos números, y luego utiliza la función metodo-recursivo, la cual suma de manera repetida el primer número tantas veces como indique el segundo. Cada suma cuenta como una unidad en el proceso. De esta forma se obtiene el producto final de la multiplicación.

</div>

<h1>Clisp</h1>

```lisp
(defun multiplicar (a b)
  (if (= b 0)
      0
      (+ a (multiplicar a (- b 1)))))

(defun potencia (base exponente)
  (if (= exponente 0)
      1
      (multiplicar base (potencia base (- exponente 1)))))

(defun inicio ()
  (format t "Ingrese la base: ")
  (let ((base (read)))
    (format t "Ingrese el exponente: ")
    (let ((exponente (read)))
      (let ((resultado (potencia base exponente)))
        (format t "El resultado de la potencia es: ~a" resultado))))
)

(inicio)
```


<h1>Python</h1>

```python
    
def potencia(base, exponente):
    if exponente == 0:
        return 1
    else:
        return base * potencia(base, exponente - 1)

def main():
   
    base = int(input("Ingrese el base: "))
    exponente = int(input("Ingrese el exponente: "))
    resultado_potencia = potencia(base, exponente)
    print(f"El resultado de la potencia es: {resultado_potencia}")

if _name_ == "_main_":
    main()
```
