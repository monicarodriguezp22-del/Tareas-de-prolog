<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<title>Explicación Código ELIZA en Prolog</title>
</head>
<body>

<div align="center">
<h2>INSTITUTO TECNOLÓGICO DE MORELIA</h2>
<h3>Programación Lógica y Funcional</h3>
<h3>Sistema Experto Proyecto</h3>
<h3>Ingeniería en Sistemas Computacionales</h3>
<h3>Monica Nayeli Rodriguez Peña</h3>
<h3>Profesor: Alcaraz Chavez Jesus Eduardo</h3>
</div>

<hr>

<div align="center">
<h3>Introducción</h3>
<p>El presente documento explica el funcionamiento del sistema experto ELIZA desarrollado en Prolog y su versión en Lisp. El sistema integra una base de conocimiento sobre enfermedades, síntomas, tratamientos, médicos, centros de atención, relaciones familiares y miembros de la familia de Miguel COCO. ELIZA simula interacción con el usuario utilizando reglas lógicas, permitiendo realizar diagnósticos automáticos, generar reportes y responder consultas sobre diferentes temas.</p>
</div>

<hr>

<div align="center">
<h3>Objetivos del Sistema</h3>
<ul>
<li>Realizar diagnóstico médico basado en síntomas del paciente.</li>
<li>Consultar relaciones familiares (padre, madre, abuelo).</li>
<li>Jugar a un Akinator para adivinar miembros de la familia coco.</li>
<li>Simular interacción con el usuario, procesando reglas lógicas y generando reportes automáticos.</li>
<li>Explicar el funcionamiento de predicados y reglas de inferencia en Prolog y Lisp.</li>
</ul>
</div>

<hr>

<div align="center">
<h3>Base de Conocimiento</h3>
<p>La base de conocimiento del sistema incluye:</p>
<ul>
<li>Enfermedades y sus síntomas (ej. fiebre, dolor de cabeza, cansancio).</li>
<li>Tratamientos y medicamentos asociados a cada enfermedad.</li>
<li>Información sobre médicos especializados y centros médicos.</li>
<li>Miembros de la familia COCO y su árbol genealógico.</li>
<li>Reglas para diagnóstico: exclusivo, por probabilidad, preventivo y combinaciones de tratamientos.</li>
<li>Relaciones familiares: padre, madre, abuelo.</li>
<li>Detección de síntomas contradictorios o inconsistentes.</li>
</ul>
</div>

<hr>

<div align="center">
<h3>Predicados principales en Prolog</h3>
<p>Esta sección contiene la definición de enfermedades, síntomas, relaciones entre ellos y tratamientos. Cada predicado permite inferir información automáticamente.</p>
<pre>
% --- Enfermedades ---
% Se definen las enfermedades conocidas por el sistema.
enfermedad(covid).
enfermedad(sinusitis).
enfermedad(bronquitis).
enfermedad(otitis).
enfermedad(gastritis).

% --- Síntomas ---
% Se definen los síntomas posibles que pueden registrar los pacientes.
sintoma(fiebre).
sintoma(tos).
sintoma(dolor_garganta).
sintoma(dificultad_respirar).

% --- Relación enfermedad ↔ síntomas ---
% Define qué síntomas corresponden a cada enfermedad.
tiene_sintoma(covid, fiebre).
tiene_sintoma(covid, tos).
tiene_sintoma(covid, dificultad_respirar).

% --- Tratamientos ---
% Asocia tratamientos a cada enfermedad.
tratamiento(covid, reposo).
tratamiento(covid, paracetamol).
</pre>
</div>

<hr>

<div align="center">
<h3>Familia COCO y Árbol Genealógico</h3>
<p>Define La Familia de COCO y un ejemplo de árbol familiar que puede ser consultado por el sistema.</p>
<pre>
% --- FAMILIA ---
Tatarabuelo(Imelda_Rivera).
Tatarabuelo(Hector_Rivera).
Tatarabuelo(Tio_Oscar).
Tatarabuelo(Tio_Felipe).
Bisabuelo(Mama_coco).
Bisabuelo(Papa_Julio).
Bisabuelo(Tia_Rosita).
Abuelo(Elena).
Abuelo(Papa_Franco).
Abuelo(Tia_Victoria).
Papa(Enrique_Rievera).
Mama(Luisa_Rivera)
Tio(Berto_Rivera)
Tia(Gloria_Rivera)
Hijo(Miguel_Rivera)
Hija(socorro)
Primo(Abel)
Primo(Benny)
Primo(Manny)
Prima(rosa)


% --- Árbol familiar de ejemplo ---
% Permite realizar consultas sobre relaciones de parentesco.
padre(Enrique_Rievera).
madre(Luisa_Rivera).
abuelo(Elena,Papa_Franco,Tia_Victoria).

padre(Berto_Rivera).
madre(Gloria_Rivera).
abuelo(Elena,Papa_Franco,Tia_Victoria).
</pre>
</div>

<hr>

<div align="center">
<h3>Diagnósticos y Reglas</h3>
<p>Se muestran las reglas utilizadas para el diagnóstico. Estas reglas permiten inferir enfermedades a partir de los síntomas registrados.</p>
<pre>
% --- Diagnóstico exclusivo ---
% Determina si un paciente tiene una enfermedad de forma exclusiva, sin coincidencias con otras enfermedades.
diagnostico_exclusivo(Paciente, Enfermedad) :-
  tiene_sintoma(Paciente, Sintoma),
  tiene_sintoma(Enfermedad, Sintoma),
  \+ (tiene_sintoma(Otra, Sintoma), Otra \= Enfermedad).

% --- Diagnóstico por probabilidad ---
% Calcula la probabilidad de que un paciente tenga una enfermedad según los síntomas coincidentes.
probabilidad(Paciente, Enfermedad, Porcentaje) :-
  findall(S, tiene_sintoma(Enfermedad, S), ListaSintomas),
  findall(S, (tiene_sintoma(Paciente, S), member(S, ListaSintomas)), Confirmados),
  length(ListaSintomas, Totales),
  length(Confirmados, Cont),
  Porcentaje is (Cont / Totales) * 100.

% --- Diagnóstico preventivo ---
% Evalúa si un paciente podría tener la enfermedad, considerando solo algunos síntomas.
diagnostico_preventivo(Paciente, Enfermedad) :-
  findall(S, tiene_sintoma(Enfermedad, S), Sintomas),
  findall(S, (tiene_sintoma(Paciente, S), member(S, Sintomas)), Confirmados),
  Confirmados \= [],
  length(Confirmados, Lc),
  length(Sintomas, Lt),
  Lc < Lt.
</pre>
</div>

<hr>

<div align="center">
<h3>Ejemplos de Consultas</h3>
<p>Estas consultas permiten al usuario interactuar con el sistema y obtener información sobre enfermedades y relaciones familiares.</p>
<pre>
?- tiene_sintoma(Berto_Rivera, fiebre).       % Consulta si el paciente tiene fiebre
?- diagnostico_exclusivo(Berto_Rivera, covid). % Verifica diagnóstico exclusivo
?- probabilidad(Berto_Rivera, covid, P).      % Calcula la probabilidad de covid
?- diagnostico_preventivo(Berto_Rivera, covid). % Diagnóstico preventivo
?- padre(juan, Berto_Rivera).                % Consulta relación de parentesco
?- jugador(Berto_Rivera).                    % Consulta si es jugador
</pre>
</div>

<hr>

<div align="center">
<h3>Funcionamiento Interno</h3>
<p>ELIZA sigue un ciclo de interacción con el usuario:</p>
<ul>
<li>El usuario ingresa síntomas mediante el comando <code>tengo(Sintoma)</code>.</li>
<li>ELIZA registra los síntomas y genera un reporte con probabilidades de enfermedades.</li>
<li>Permite jugar al Akinator con <code>quiero_jugar</code>, filtrando jugadores por posición y nacionalidad.</li>
<li>Permite consultar relaciones familiares usando <code>padre(X,Y)</code>, <code>madre(X,Y)</code> o <code>abuelo(X,Y)</code>.</li>
<li>Si el comando ingresado no es reconocido, ELIZA responde con un mensaje de error.</li>
</ul>
</div>

<hr>

<div align="center">
<h3>Implementación en Prolog</h3>
<p>El siguiente código muestra la implementación completa en Prolog, incluyendo predicados, reglas de diagnóstico, Akinator y árbol familiar.</p>
<pre>
:- encoding(utf8).

% --- Definición dinámica ---
% Permite agregar y eliminar información durante la ejecución
:- dynamic tiene_sintoma/2.
:- dynamic candidatos/1.

% --- Función principal ELIZA ---
% Inicia la interacción con el usuario
eliza :-
    retractall(tiene_sintoma(_,_)),
    retractall(candidatos(_)),
    writeln('Hola, soy ELIZA.'),
    writeln('Comandos disponibles:'),
    writeln('- tengo(sintoma).'),
    writeln('- reporte.'),
    writeln('- quiero_jugar.'),
    writeln('- padre(X,Y). madre(X,Y). abuelo(X,Y).'),
    writeln('- adios.'),
    ciclo.

% --- Ciclo de interacción ---
ciclo :-
    write('|: '),
    read(Entrada),
    procesar(Entrada),
    Entrada \= adios,
    ciclo.
ciclo :- writeln('Adios.').

% --- Procesamiento de comandos ---
procesar(adios) :- !.  % Termina la interacción

procesar(quiero_jugar) :- iniciar_akinator, !. % Inicia Akinator

procesar(tengo(S)) :-    % Registra síntomas
    assertz(tiene_sintoma(paciente, S)),
    writeln(['Sintoma registrado:', S]), !.

procesar(reporte) :- reporte(paciente), !. % Genera reporte médico

procesar(X) :- call(X), writeln('Consulta realizada.'), !. % Ejecuta cualquier predicado

procesar(_) :- writeln('No te entendi.'). % Comando desconocido

% --- Base jugadores ---
% Información de la familia Rivera de Coco y características
persona(imelda_rivera, tatarabuela, fallecida).
persona(hector_rivera, tatarabuelo, fallecido).
persona(coco_rivera, bisabuela, fallecida).
persona(julio_rivera, bisabuelo, fallecido).
persona(elena_rivera, abuela, viva).
persona(franco_rivera, abuelo, vivo).
persona(enrique_rivera, padre, vivo).
persona(luisa_rivera, madre, viva).
persona(miguel_rivera, protagonista, vivo).
persona(socorro_rivera, hermana, viva).
persona(oscar_rivera, tio_abuelo, fallecido).
persona(felipe_rivera, tio_abuelo, fallecido).
persona(rosita_rivera, tia_abuela, fallecida).
persona(victoria_rivera, tia, fallecida).
persona(berto_rivera, tio, vivo).
persona(carmen_rivera, tia, viva).
persona(abel_rivera, primo, vivo).
persona(rosa_rivera, prima, vivo).

% --- Akinator Familia Coco ---
:- dynamic candidatos/1.

iniciar_akinator :-
    findall(N, persona(N,_,_), Lista),
    retractall(candidatos(_)),
    assertz(candidatos(Lista)),
    writeln('Piensa en un familiar de COCO.'),
    preguntar_generacion.

preguntar_generacion :-
    writeln('¿Es de las generaciones pasadas (tatarabuelo/bisabuelo)? (si/no)'),
    read(R),
    filtrar_generacion(R),
    siguiente_pregunta.

siguiente_pregunta :-
    candidatos([Unico]),
    writeln(['Estoy pensando en:', Unico]), !.


siguiente_pregunta :-
    writeln('¿El personaje está vivo en la película? (si/no)'),
    read(R),
    filtrar_estado(vivo, R),
    finalizar_akinator.

finalizar_akinator :-
    candidatos([Unico]),
    writeln(['Estoy pensando en:', Unico]), !.

finalizar_akinator :-
    candidatos(Lista),
    writeln(['No pude estar 100% segura, opciones:', Lista]).

% --- Filtros ---
filtrar_generacion(si) :-
    candidatos(L),
    findall(X, (member(X, L), (persona(X, tatarabuela, _); persona(X, tatarabuelo, _); persona(X, bisabuela, _); persona(X, bisabuelo, _))), NL),
    retractall(candidatos(_)), assertz(candidatos(NL)).
filtrar_generacion(no).

filtrar_estado(Est, si) :-
    candidatos(L),
    include(es_estado(Est), L, NL),
    retractall(candidatos(_)), assertz(candidatos(NL)).
filtrar_estado(Est, no) :-
    candidatos(L),
    exclude(es_estado(Est), L, NL),
    retractall(candidatos(_)), assertz(candidatos(NL)).

es_estado(E, P) :- persona(P, _, E).

% --- Relaciones familiares de Coco ---
padre_de(hector, coco).
padre_de(julio, elena).
padre_de(franco, enrique).
padre_de(enrique, miguel).
madre_de(imelda, coco).
madre_de(coco, elena).
madre_de(elena, enrique).
madre_de(luisa, miguel).

abuelo(X,Y) :- (padre_de(X,Z); madre_de(X,Z)), (padre_de(Z,Y); madre_de(Z,Y)).

% --- Enfermedades y síntomas ---
enfermedad(anemia).
enfermedad(apendicitis).
enfermedad(covid).

tiene_sintoma_enfermedad(cansancio, anemia).
tiene_sintoma_enfermedad(palidez, anemia).

tiene_sintoma_enfermedad(dolor_abdominal, apendicitis).
tiene_sintoma_enfermedad(fiebre, apendicitis).

tiene_sintoma_enfermedad(fiebre, covid).
tiene_sintoma_enfermedad(tos_seca, covid).

% --- Tratamientos ---
tratamiento(anemia, hierro).
tratamiento(apendicitis, cirugia).
tratamiento(covid, reposo).

% --- Reglas de diagnóstico ---
diagnostico_basico(P,E) :-
    enfermedad(E),
    forall(
        tiene_sintoma(P,S),
        tiene_sintoma_enfermedad(S,E)
    ).

probabilidad(P,E,Porc) :-
    findall(S,tiene_sintoma_enfermedad(S,E),T),
    findall(S,(tiene_sintoma(P,S),tiene_sintoma_enfermedad(S,E)),C),
    length(T,LT), length(C,LC),
    LT>0, Porc is LC*100//LT.

reporte(P) :-
    writeln('--- REPORTE ---'),
    findall(S,tiene_sintoma(P,S),Sx),
    writeln(['Sintomas:',Sx]),
    forall(enfermedad(E),
        (probabilidad(P,E,Pc),
         writeln([E,Pc,'%']))
    ).

% --- Relaciones familiares ---
padre(juan,carlos).
padre(carlos,pedro).
madre(maria,carlos).
madre(ana,pedro).

abuelo(X,Y) :- padre(X,Z), padre(Z,Y).
abuelo(X,Y) :- padre(X,Z), madre(Z,Y).
abuelo(X,Y) :- madre(X,Z), padre(Z,Y).
abuelo(X,Y) :- madre(X,Z), madre(Z,Y).
</pre>
</div>

<hr>

<div align="center">
<h2>PROYECTO FINAL – ELIZA EN LISP</h2>
</div>

<hr>

<div align="center">
<h3>Base de Conocimiento – Jugadores del Club América</h3>
<p>Esta sección define los jugadores, su posición y nacionalidad. Esta información es utilizada por Akinator para realizar preguntas de filtrado.</p>
<pre>
(defparameter *familia-coco*
  '((imelda-rivera tatarabuela fallecido)
    (hector-rivera tatarabuelo fallecido)
    (coco-rivera bisabuela fallecido)
    (julio-rivera bisabuelo fallecido)
    (elena-rivera abuela vivo)
    (franco-rivera abuelo vivo)
    (enrique-rivera padre vivo)
    (luisa-rivera madre vivo)
    (miguel-rivera protagonista vivo)
    (victoria-rivera tia fallecido)
    (berto-rivera tio vivo)))
</pre>
</div>

<hr>

<div align="center">
<h3>Base de Conocimiento – Medicina</h3>
<p>Define las enfermedades conocidas, los síntomas asociados y los tratamientos correspondientes. Se utiliza para calcular probabilidades y generar reportes.</p>
<pre>
(defparameter *enfermedades*
  '((anemia (cansancio palidez) hierro)
    (apendicitis (dolor-abdominal fiebre) cirugia)
    (covid (fiebre tos-seca) reposo)))
</pre>
</div>

<hr>

<div align="center">
<h3>Base de Conocimiento – Familia</h3>
<p>Contiene relaciones familiares que permiten consultar padre, madre y abuelo. Se utilizan funciones para evaluar estas relaciones.</p>
<pre>
(defparameter *familia*
  '((padre juan carlos)
    (padre carlos pedro)
    (madre maria carlos)
    (madre ana pedro)))

(defun padre-p (x y)
  (member (list 'padre x y) *familia* :test #'equal))

(defun madre-p (x y)
  (member (list 'madre x y) *familia* :test #'equal))

(defun abuelo-p (x y)
  (some (lambda (z)
          (and (or (padre-p x z) (madre-p x z))
               (or (padre-p z y) (madre-p z y))))
        '(juan carlos pedro)))
</pre>
</div>

<hr>

<div align="center">
<h3>Medicina – Funciones</h3>
<p>Funciones que permiten registrar síntomas, calcular probabilidades de enfermedades y generar reportes completos de manera automatizada.</p>
<pre>
(defparameter *sintomas-paciente* '())

(defun agregar-sintoma (s)
  (push s *sintomas-paciente*)
  (format t "Sintoma registrado: ~a~%" s))

(defun probabilidad (enfermedad)
  (let* ((datos (assoc enfermedad *enfermedades*))
         (sintomas (second datos))
         (total (length sintomas))
         (coinciden (length
                     (intersection sintomas *sintomas-paciente*))))
    (if (> total 0)
        (* 100 (/ coinciden total))
        0)))

(defun reporte-medico ()
  (format t "~%--- REPORTE MEDICO ---~%")
  (format t "Sintomas: ~a~%" *sintomas-paciente*)
  (dolist (e *enfermedades*)
    (format t "~a: ~a%%~%"
            (first e)
            (probabilidad (first e)))))
</pre>
</div>

<hr>

<div align="center">
<h3>Akinator – Familia COCO</h3>
<p>Permite al usuario pensar en un jugador y ELIZA/Akinator hace preguntas de filtrado por posición y nacionalidad para adivinar al jugador.</p>
<pre>
(defparameter *candidatos* '())

(defun iniciar-akinator ()
  (setf *candidatos* *familia-coco*)
  (format t "~%Piensa en un integrante de la familia Rivera (Coco).~%")
  (pregunta-estado))

(defun pregunta-estado ()
  (format t "¿El personaje está vivo? (si/no): ")
  (let ((r (read)))
    (if (equal r 'si)
        (setf *candidatos* (remove-if-not (lambda (x) (equal (third x) 'vivo)) *candidatos*))
        (setf *candidatos* (remove-if-not (lambda (x) (equal (third x) 'fallecido)) *candidatos*)))
    (verificar-candidatos)))

(defun verificar-candidatos ()
  (cond ((null *candidatos*) (format t "No encontre a nadie con esa descripcion.~%"))
        ((= (length *candidatos*) 1) 
         (format t "¡Ya lo tengo! Es: ~a~%" (first (first *candidatos*))))
        (t (format t "Aun tengo dudas, opciones: ~a~%" (mapcar #'first *candidatos*)))))