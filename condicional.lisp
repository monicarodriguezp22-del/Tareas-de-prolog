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