<div align="center">
<img src="d:\PROLOG\Logo-TecNM.png" width="290" height="90" alt="Tec Morelia Logo">
<img src="d:\PROLOG\136706.png" width="120" alt="Tec Morelia Logo">


---

# INSTITUTO TECNOLÓGICO DE MORELIA  

## Ejercicios de condicionales clisp

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
<div align="justify">

<h1>Ejercicio 1</div>
1.- Que calcule el sueldo que le corresponde al trabajador de una
empresa que cobra 40.000 euros anuales, el programa debe realizar los
cálculos en función de los siguientes criterios:

- Si lleva más de 10 años en la empresa se le aplica un aumento del 10%.
- Si lleva menos de 10 años pero más que 5 se le aplica un aumento del
  7%.
- Si lleva menos de 5 años pero más que 3 se le aplica un aumento del
  5%.
- Si lleva menos de 3 años se le aplica un aumento del 3%.()


```lisp
(defun calcular-sueldo (tiempo)
  (let ((sueldo-base 40000))
    (cond ((> tiempo 10) (* sueldo-base 1.10))  ; +10%
          ((and (> tiempo 5) (<= tiempo 10)) (* sueldo-base 1.07)) ; +7%
          ((and (> tiempo 3) (<= tiempo 5)) (* sueldo-base 1.05))  ; +5%
          ((<= tiempo 3) (* sueldo-base 1.03))))) ; +3%

(defun saludar(nombre)
        ( cond ((eq nombre 'juan)'(Hola juan))
                ((eq nombre 'maria)'(Hola maria))
                ((eq nombre 'lupe)'(Hola lupe))
                (t '(No se quien seas))



        )
)
```
---


<h1>Ejercicio 2</h1>
2.- Hacer un algortimo que tome el peso en libras de una cantidad de
ropa a lavar en una lavadora y nos devuelva el nivel dependiendo del
peso; además nos informe la cantidad de litros de agua que
necesitamos. Se sabe que con más de 30 libras la lavadora no funcionara
ya que es demasiado peso. Si la ropa pesa 22 ó más libras, el nivel será
de máximo; si pesa 15 ó más nivel será de alto; si pesa 8 ó más será un
nivel medio o de lo contrario el nivel será minimo

```lisp
(defun requisitos-fiesta (edad)
  (cond
    ((< edad 15)
     (format t "Edad: ~D años~%" edad)
     (format t "No puede entrar a la fiesta.~%"))
    ((= edad 15)
     (format t "Edad: ~D años~%" edad)
     (format t "Entra totalmente GRATIS.~%"))
    ((> edad 15)
     (format t "Edad: ~D años~%" edad)
     (format t "Puede entrar pero debe traer REGALO.~%"))))
```

----
<h1>Ejerciocio 3</h1>

3.- Martha va a realizar su fiesta de quince años. Por lo cual ha
invitado a una gran cantidad de personas. Pero también ha decidido
algunas reglas: Que todas las personas con edades mayores a los quince
años, sólo pueden entrar si traen regalos; que jóvenes con los quince
años cumplidos entra totalmente gratis pero los de menos de quince años
no pueden entrar a la fiesta. Hacer un algoritmo donde se tome la edad
de una persona y que requisito de los anteriores le toca cumplir si
quiere entrar.

```(defun requisitos-fiesta (edad)
  (cond
    ((< edad 15)
     (format t "Edad: ~D años~%" edad)
     (format t "No puede entrar a la fiesta.~%"))
    ((= edad 15)
     (format t "Edad: ~D años~%" edad)
     (format t "Entra totalmente GRATIS.~%"))
    ((> edad 15)
     (format t "Edad: ~D años~%" edad)
     (format t "Puede entrar pero debe traer REGALO.~%"))))
```
</div>

