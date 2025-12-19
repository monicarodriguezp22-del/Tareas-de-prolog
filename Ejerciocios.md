<div align="center">
<img src="d:\PROLOG\Logo-TecNM.png" width="290" height="90" alt="Tec Morelia Logo">
<img src="d:\PROLOG\136706.png" width="120" alt="Tec Morelia Logo">


---

# INSTITUTO TECNOLÓGICO DE MORELIA  

## Ejercicios car y cdr

### Ingeniería en Sistemas Computacionales
### Programación Lógica y Funcional


---

### Integrante | N.C.:
**Monica Nayeli Rodriguez Peña ** | **21121564**

---

**Profesor:** Alcaraz Chavez Jesus Eduardo

---

MORELIA, MICHOACÁN  
**Sep 2025**

</div>

<div>

```lisp
1 Problemas con car y cdr
Lista: (a b c d e) → Extraer d
Lista: ((1 2) (3 4) (5 6)) → Extraer 5
Lista: ((a b) (c d) (e f)) → Extraer e
Lista: ((x y) ((p q) (r s)) (z w)) → Extraer z
Lista: ((1 (2 3)) (4 (5 6))) → Extraer 6
Lista: (((a b) c) d e) → Extraer c
Lista: (((1 2) 3) ((4 5) 6)) → Extraer 6
Lista: ((p (q (r s))) t u) → Extraer (r s)
Lista: (((a) b) (c (d e)) f) → Extraer d
Lista: ((1 (2 (3 4))) (5 6)) → Extraer 3
Lista: (((x) (y)) ((z) (w))) → Extraer (w)
Lista: ((a (b (c d))) (e f)) → Extraer c
Lista: ((1 (2 (3 (4 5)))) (6 7)) → Extraer 4
Lista: (((a b) c) ((d e) f) ((g h) i)) → Extraer g
Lista: (((x y) (z w)) ((p q) (r s))) → Extraer r
Lista: ((1 (2 (3 (4 (5 6))))) (7 8)) → Extraer 5
Lista: ((a (b (c (d e)))) (f g)) → Extraer d
Lista: (((1 2) (3 4)) ((5 6) (7 8))) → Extraer 7
Lista: ((x (y (z (w v))))) → Extraer w
Lista: (((a b c) (d e f)) ((g h i) (j k l))) → Extraer j
```

Para la soucion de este problema lo fui haciendo por partes de ya que ese conforma por listas sublistas y cabeceras de las listas para comenzar en todas me movia con cadr para visualizar la zona a efectuar del codigo y poder enfocarme en una solucion 


### Respuestas

```lisp
(defun lista ()
  ;; (a b c d e) → d
  (print (cadddr '(a b c d e)))                                 ; d

  ;; ((1 2) (3 4) (5 6)) → 5
  (print (car (car (cddr '((1 2) (3 4) (5 6))))))               ; 5

  ;; ((a b) (c d) (e f)) → e
  (print (car (car (cddr '((a b) (c d) (e f))))))               ; e

  ;; ((x y) ((p q) (r s)) (z w)) → z
  (print (car (car (cddr '((x y) ((p q) (r s)) (z w))))))       ; z

  ;; ((1 (2 3)) (4 (5 6))) → 6
  (print (cadr (cadr (cadr '((1 (2 3)) (4 (5 6)))))))           ; 6

  ;; ((p (q (r s))) t u) → (r s)
  (print (cadr (cadr (car '((p (q (r s))) t u)))))              ; (r s)

  ;; (((a) b) (c (d e)) f) → d
  (print (car (cadr (cadr '(((a) b) (c (d e)) f)))))            ; d

  ;; ((1 (2 (3 4))) (5 6)) → 3
  (print (car (cadr (cadr (car '((1 (2 (3 4))) (5 6)))))))      ; 3

  ;; (((x) (y)) ((z) (w))) → (w)
  (print (cadr (cadr '(((x) (y)) ((z) (w))))))                  ; (w)

  ;; ((a (b (c d))) (e f)) → c
  (print (car (cadr (cadr (car '((a (b (c d))) (e f)))))))      ; c

  ;; ((1 (2 (3 (4 5)))) (6 7)) → 4
  (print (car (cadr (cadr (cadr (car '((1 (2 (3 (4 5)))) (6 7)))))))) ; 4

  ;; (((a b) c) ((d e) f) ((g h) i)) → g
  (print ( caar (caddr '(((a b) c) ((d e) f) ((g h) i)))))  ; g

  ;; (((x y) (z w)) ((p q) (r s))) → r
  (print(car (cadr(cadr '(((x y) (z w)) ((p q) (r s)))))))

  ;; ((1 (2 (3 (4 (5 6))))) (7 8)) → 5
  (print (car (cadr (cadr (cadr (cadr (car '((1 (2 (3 (4 (5 6))))) (7 8))))))))) ; 5

  ;; ((a (b (c (d e)))) (f g)) → d
  (print (car (cadr (cadr (cadr (car '((a (b (c (d e)))) (f g)))))))) ; d

  ;; (((1 2) (3 4)) ((5 6) (7 8))) → 7
  (print(car(cadr(cadr '(((1 2) (3 4)) ((5 6) (7 8)))))))

  ;; ((x (y (z (w v))))) → w
  (print (car (cadr (cadr (cadr (car '((x (y (z (w v))))))))))) ; w

  ;; (((a b c) (d e f)) ((g h i) (j k l))) → j
  (print (car(cadr(cadr '(((a b c) (d e f)) ((g h i) (j k l)))))))

)

(lista)



```


----

### Ejercicio 1
Dada una lista de pares clave-valor, usar ‘assoc‘ para obtener el valor de la
clave ‘’edad‘. Lista de ejemplo:
(setq persona '((nombre . "Ana") (edad . 23) (ciudad . "Morelia")))
Pregunta: ¿cómo obtener la edad con ‘assoc‘, ‘cdr‘ y ‘car‘?

```lisp 
(setq persona '((nombre . "Ana") (edad . 23) (ciudad . "Morelia")))
(cdr (assoc 'edad persona)) ; => 23
```

### 2.2 Ejercicio 2
Usar ‘if‘ para escribir una función que diga si el primer elemento de una lista
es un número positivo o no. Ejemplo:
(mi-funcion '(5 3 2)) ; => "positivo"
(mi-funcion '(-2 1 4)) ; => "no positivo"

```lisp 
(defun positvio (lista)
  (if (> (car lista) 0)
      "positivo"
      "no positivo"))

```

### 2.3 Ejercicio 3
Definir una función que recorra una lista de números con ‘mapcar‘ y devuelva
una nueva lista que contenga solo el doble de los números pares. Restricción:
usar ‘if‘ dentro de ‘mapcar‘.

``` lisp 
(defun doble-pares (lista)
  (mapcar (lambda (x) 
            (if (evenp x) 
                (* 2 x) 
                x)) 
          lista))
```


### 2.4 Ejercicio 4
Usar ‘cond‘ para hacer una función que reciba un símbolo que puede ser
‘rojo‘, ‘azul‘ o ‘verde‘ y regrese un mensaje:
• rojo → "Color cálido"
• azul → "Color frío"
• verde → "Color neutro"
• cualquier otro → "Color desconocido"


```lisp
(defun clasificar-color (color)
  (cond
    ((eq color 'rojo) "Color cálido")
    ((eq color 'azul) "Color frío")
    ((eq color 'verde) "Color neutro")
    (t "Color desconocido")))
```

### 2.5 Ejercicio 5
Escribir una función que use ‘case‘ para clasificar un día de la semana (‘lunes‘,
‘martes‘, . . . ):
• lunes a viernes → "día laboral"
• sábado, domingo → "fin de semana"

```lisp 
(defun clasificar-dia (dia)
  (case dia
    ((lunes martes miercoles jueves viernes) "día laboral")
    ((sabado domingo) "fin de semana")))
```

### 2.6 Ejercicio 6
Definir una función que reciba una lista y con ‘when‘ imprima el primer
elemento si la lista no está vacía.

```lisp 
(defun imprimir-primer-elemento (lista)
  (when lista
    (print (car lista))))
```

### 2.7 Ejercicio 7
Definir una función que reciba una lista y con ‘unless‘ imprima "lista vacía"
cuando la lista no tenga elementos.
```lisp 
(defun verificar-lista-vacia (lista)
  (unless lista
    (print "lista vacía")))
```

### 2.8 Ejercicio 8
Dada una lista de listas, usar ‘mapcar‘, ‘car‘ y ‘cdr‘ para obtener una nueva
lista con los primeros elementos de cada sublista. Ejemplo:
(mi-funcion '((1 2) (3 4) (5 6))) ; => (1 3 5)

```lisp 
(defun primeros-elementos (lista)
  (mapcar 'car lista))

```


### 2.9 Ejercicio 9
Dada una lista de asociación:
(setq alumnos '((juan . 8) (maria . 10) (ana . 9)))
Escribir una función que, dado un nombre, devuelva "Aprobado" si la calificación es >= 8, o "Reprobado" en caso contrario. Usar ‘assoc‘, ‘cdr‘ y
‘if‘.

```lisp 
(setq alumnos '((juan . 8) (maria . 10) (ana . 9)))

(defun verificar-aprobacion (nombre)
  (let ((calificacion (cdr (assoc nombre alumnos))))
    (if (>= calificacion 8)
        "Aprobado"
        "Reprobado")))
```



### 2.10 Ejercicio 10
Definir una función que use ‘cond‘ para evaluar una lista de números y devolver:
• "vacía" si no hay elementos,
• "un solo elemento" si la lista tiene uno,
• "larga" si tiene más de uno


```lisp 
(defun evaluar-lista (lista)
  (cond
    ((null lista) "vacía")
    ((null (cdr lista)) "un solo elemento")
    (t "larga")))
```
</div> 
