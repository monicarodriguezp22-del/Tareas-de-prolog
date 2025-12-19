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
