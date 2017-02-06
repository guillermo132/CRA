% Autor:
% Fecha: 15/03/2016

pais(italia). %italia es un pais
pais(españa).
pais(portugal).
pais(francia).
pais(alemania).
pais(belgica).

%es_un_pais(X), write(X), nl, fail.
% Escribe todas las X que sean paises
% Fail = bucle

limita_con(españa, portugal). %España limita con Portugal
limita_con(españa, francia). %España limita con Francia

limita_con(francia, españa). %Francia limita con España
limita_con(francia, italia). %Francia limita con Italia
limita_con(francia, alemania). %Francia limita con Alemania
limita_con(francia, suiza). %Francia limita con Belgica

%limita_con(X,Y), write(X), write(' '), write(Y), nl, fail.
%españa portugal
%españa francia
%francia españa
%francia italia
%francia alemania
%francia suiza
%false.

%Video número 3
%Si ahora nos damos cuenta, si ponemos que si suiza limita con francia,
%nos daría falso, ya que no le hemos dicho que sea reciproco, y de ninguna
%manera hemos definido que suiza limita con francia. En el caso de españa
%y francia, si lo hemos puesto, pero no haría falta, con lo que vamos a hacer:

limites(X,Y):- limita_con(X,Y); % OR
               limita_con(Y,X).
%limites(X,Y):- limita_con(Y,X).

%Ahora para que saliera, tendríamos que usar la regla limites(X,Y) OJO

%Video número 4

superficie(españa, 15000).
superficie(francia, 20000).
superficie(alemania, 220000).
superficie(belgica, 1000).

pais_pequeño(X):- superficie(X,Y), Y < 5000.
pais_grande(X):- superficie(X,Y), Y >= 5000.

%pais_grande(X), write(X), nl, fail.

%Video número 5
%Ejercicio que sean translimitrofes xD Ejemplo: España y Suiza, tiene Francia de por medio

translimitrofes(X,Y):- limites(X,Z),
                  limites(Z,Y),
                  dif(X,Y),
                  not(limites(X,Y)).





