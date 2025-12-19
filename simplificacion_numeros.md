<div align="center">
<img src="./imgs/logos/tec_mexico.png" width="290" height="90" alt="Tec Morelia Logo">
<img src="./imgs/logos/tec_morelia.png" width="120" alt="Tec Morelia Logo">


---

# INSTITUTO TECNOLÓGICO DE MORELIA  

## Descomposicion de numeros

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

<h1>Introducción</h1> 
La descomposición de unidades es un problema fundamental en matemáticas discretas y ciencias de la computación. Este proceso consiste en encontrar todas las posibles combinaciones de números que sumen exactamente a un valor dado. Las aplicaciones de este algoritmo son diversas, desde la optimización de recursos hasta el análisis combinatorio y la planificación de tareas.

En el contexto de la programación funcional, específicamente en CLISP, la recursión se convierte en una herramienta poderosa para resolver este tipo de problemas. LISP, siendo uno de los lenguajes de programación más antiguos aún en uso, ofrece características únicas para la manipulación simbólica y el procesamiento recursivo que lo hacen ideal para implementar algoritmos de descomposición.

</div>


<div align=center>
<h1>Desarrollo</h1>

En este codigo lo que se hace es hacer un metodo recursivo para descomponer un numero dado por el usuario donde se usa una lista_actual donde vamos a tener el numero que estamos tratando de descomponer y la descomposicion de la unidad con dos dondicionales donde nos permite comparar el valor de la lista actual por el numero que intetamos descomponer y lo hacemos ciclicamente en un for para optener todas las cantidades del numero
</div>


```lisp
(defun descomponer-unidad (n &optional (min 1) (lista-actual '()))
  (cond
    ((= n 0) (list lista-actual))  
    ((< n min) '())               
    (t                             
      (append
        (descomponer-unidad n (+ min 1) lista-actual)  
        (loop for i from min to n
              append (descomponer-unidad (- n i) i (cons i lista-actual)))))))
```

