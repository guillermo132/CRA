% Autor:
% Fecha: 15/03/2016

pais(italia). %italia es un pais
pais(espa�a).
pais(portugal).
pais(francia).
pais(alemania).
pais(belgica).

%es_un_pais(X), write(X), nl, fail.
% Escribe todas las X que sean paises
% Fail = bucle

limita_con(espa�a, portugal). %Espa�a limita con Portugal
limita_con(espa�a, francia). %Espa�a limita con Francia

limita_con(francia, espa�a). %Francia limita con Espa�a
limita_con(francia, italia). %Francia limita con Italia
limita_con(francia, alemania). %Francia limita con Alemania
limita_con(francia, suiza). %Francia limita con Belgica

%limita_con(X,Y), write(X), write(' '), write(Y), nl, fail.
%espa�a portugal
%espa�a francia
%francia espa�a
%francia italia
%francia alemania
%francia suiza
%false.

%Video n�mero 3
%Si ahora nos damos cuenta, si ponemos que si suiza limita con francia,
%nos dar�a falso, ya que no le hemos dicho que sea reciproco, y de ninguna
%manera hemos definido que suiza limita con francia. En el caso de espa�a
%y francia, si lo hemos puesto, pero no har�a falta, con lo que vamos a hacer:

limites(X,Y):- limita_con(X,Y); % OR
               limita_con(Y,X).
%limites(X,Y):- limita_con(Y,X).

%Ahora para que saliera, tendr�amos que usar la regla limites(X,Y) OJO

%Video n�mero 4

superficie(espa�a, 15000).
superficie(francia, 20000).
superficie(alemania, 220000).
superficie(belgica, 1000).

pais_peque�o(X):- superficie(X,Y), Y < 5000.
pais_grande(X):- superficie(X,Y), Y >= 5000.

%pais_grande(X), write(X), nl, fail.

%Video n�mero 5
%Ejercicio que sean translimitrofes xD Ejemplo: Espa�a y Suiza, tiene Francia de por medio

translimitrofes(X,Y):- limites(X,Z),
                  limites(Z,Y),
                  dif(X,Y),
                  not(limites(X,Y)).





