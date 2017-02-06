%PECL1: Buscaminas en prolog
%Autores:
         %Rafael Lujan
         %Ivan Parrilla
         %David Peces

%Fecha: 24 Marzo 2016

%*************************************** Solicitud de datos

leerFil(X):- repeat, write('Filas?(9-24)?: '), read(X),comprobarFil(X), !.
leerCol(Y):- repeat, write('Columnas?(9-30): '), read(Y),comprobarCol(Y), !.
leerBom(X,Y,Z):- repeat, write('Bombas?(10-81): '), read(Z),comprobarBom(X,Y,Z), !.

%*************************************** Comprobar datos
%*************************************** Si no se cumpliera, vuelve al método que le llamó.

comprobarFil(X):- integer(X), between(9,24,X).  %write(X) write(' filas').
comprobarCol(Y):- integer(Y), between(9,30,Y).  %write(Y) write(' columnas').
comprobarBom(X,Y,Z):- integer(Z),N is ((X-1)*(Y-1)), between(10,N,Z), write(Z), write(' bombas').

%comprobarFilSel
%comprobarColSel

%comprobarJugada

%*************************************** Jugar

%pedirFil(X):- repeat, write('Fila: '), read(X), !.
%pedirCol(Y):- repeat, write('Columna: '), read(Y), !.

jugar:- write('Elija el tamaño del tablero y el número de bombas.')
        ,nl,leerFil(X),leerCol(Y),leerBom(X,Y,Z),nl,write('Este es el tablero inicial'),nl.


%*************************************** Comprobar si los valores son correctos, están en los límites permitidos


%--------------------------Operaciones para listas--------

%Saber si valor es 0 o no.
cero(0):- true.
cero(_):- false.

%Saber si un valor es True o false.
esTrue('T'):- true.
esTrue('F'):- false.

%Nos devuelve longitud de la lista.
long([],N):- N is 0.
long([ |X],N):- long(X,N1), N is N1 + 1.

%Comprueba si termino X esta dentro de la lista
esta(X,[X|_]).%aqui X es una lista en la que X es la cabeza
esta(X,[_|Tail]) :- esta(X,Tail). %si se encuentra X en la cola.

%Obtener posicion en lista
posicionLista(0,[Head|_],E). %Si el elemento es la cabeza entonces posicion 0
posicionLista(Posicion,[_|Tail],E):- X is Posicion-1,posicion?(X,T,E).

%Obtener posicion en matriz. Matriz es una lista de listas
%Primero buscamos que fila seria y luego la posicion

posicionMatriz(Fil,Col,T,L):- posicionLista(Fil,T,Lista), posicionLista(Col,Lista,L).

%Insertar en una posicion de una lista 

insertar(0,E,[_|Tail],[E|Tail]).%Si es la posicion 0 insertamos en la cabeza (posicion,elem,donde,resultante)
insertar(Posicion,E,[Head|Tail],[Head|L]):- X is Posicion-1,insertarEnPosicion(X,V,T,L).

%Insertar elemento al principio de una lista
insertarIni(X,[],[X]).
insertarIni(X,[Y|Ys],[Y|Zs]):-insertar(X,Ys,Zs),!.

%Insertar elemento al final de una lista
insertarFin(X,[],[X]).
insertarFin(X,[C|L],[C|L1]):-insertarFin(X,L,L1).

%Insertar en una posicion de la matriz
%Pimero buscamos la fila, posteriormente insertamos el valor V y para finalizar insertamos esta nueva fila en la matriz

insertarMatriz(Fil,Col,E,L,Lista):- posicionLista(Fil,L,Aux),insertar(Col,E,Aux,Lista2),insertar(Fila,Lista2,L,Lista).


%Funcion para tomar un entero de una lista y convertirlo en entero puro.

preprocesar(X,X):-atomic(X),!.
preprocesar(L,X):-obtenerPosicion(0,L,X).

%Sumar una unidad al valor X devolviendolo en R.
sucesor(X,R):- R is X+1.

%*************************************** Generar Tablero*****************************************************


%---------------Crear nueva lista
%Tamaño->X que se va reduciendo hasta que sea 0 y nos devuelva la lista.

nuevaLista(0,_,_).
crearLista(X,E,Lista):- Y is X -1, crearLista(Y,E,L),insertarIni(E,L,Lista),!.

%---------------Crear nueva matriz
% X: filas, Y:columnas. Disminuimos el valor de las filas y vamos añadiendo en cada una de las listas

nuevaMatriz(0,_,_,_).
crearMatriz(X,Y,V,Matriz):- Z is X-1, crearMatriz(Z,Y,E,M),crearLista(Y,E,L), insertarIni(L,M,Matriz),!.

%I->filas,J->columnas,E->Elemento,B->bomba,M2->juego,MF->juego despues de mover,M3F->booleanos despues de mover
%Modificar el tablero segun la jugada del jugador

actualizaTablero(J,H,B,M2,M3,MF,M3F,Jugada,JugadaRes):- posicionMatriz(J,H,B,E),esCero(J,H,E,B,M2,M3,MF,M3F,Jugada,JugadaRes).

%Comprobamos si un valor es 0 para que pueda expandir a sus vecinos.

%--------------------ME FALTA SOLO ESTO YAAAAAAAA-------------



***************************************************** CREACION DE MINAS ALEATORIAS *****************************************************

%M->Matriz rellena de ceros. 
%Creamos un nuevo tablero de bombas con un numero de bombas->N, el proceso consiste en sacar la posicion aleatoria de la estaBomba,
%insertamos en la matriz con la letra 'B', miramos sus vecinos, y actualizamos la matriz
matrizBombas(0,_,_,Matriz,Matriz).
matrizBombas(N,Filas,Columnas,M,Matriz):- estaBomba(Filas,Columnas,F,C,M),insertarMatriz(F,C,'B',M,MatrizAux)
                                           ,Bom is N-1,vecinosTotales(F,C,MatrizAux,MFB),matrizBombas(Bom,Filas,Columnas,MFB,Matriz),!.

%Repite el proceso hasta encontrar una posicion en la que no haya ninguna bomba para evitar superponerlas

estaBomba(Filas,Columnas,F,C,M):- repeat, coordBomba(Filas,Columnas,F,C),\+(posicionMatriz(F,C,M,'B')),!.
                                                                                   
%Nos da un valor aleatorio entre 0 y Maximo-> fil * col para que no se salga del rango
aleatorio(Max,V):- M is Max, random(0,M,V).
 
%Coordenadas de una bomba
coordBomba(Fil,Col,F,C):- aleatorio(Fil,F),aleatorio(Col,C).


%*************************************** Vecinos ************************************


%Mira los vecinos de la coordenada de la bomba, y devuelve en M2 la matriz con las iteraciones sobre las casillas de los vecinos
%realizadas. Si se encuentra una bomba o se intenta acceder a una casilla inexistente en la matriz, no se hace nada.


vecinosTotales(F,C,M,MFinal):- vecino1(F,C,M,M2),vecino2(F,C,M2,M3) ,vecino3(F,C,M3,M4),vecino4(F,C,M4,M5) ,vecino5(F,C,M5,M6),vecino6(F,C,M6,M7)
,vecino7(F,C,M7,M8),vecino8(F,C,M8,MFinal),!.


%X X X
%X - X
%X X X

%Cada uno de los vecinos recoge el valor de una de las casillas contiguas a las coordenadas F-C, la pasa de lista a entero mediante preprocesar, y
% le suma 1 con el sucesor. Ese valor resultante, lo insertamos en la matriz M devolviendola modificada en M2.
vecino1(F,C,M,M2):- A is F-1,B is C-1,posicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarMatriz(A,B,R,M,M2). %arriba-izquierda
vecino1(_,_,M,M).
vecino2(F,C,M,M2):- A is F-1,B is C  ,posicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarMatriz(A,B,R,M,M2). %arriba
vecino2(_,_,M,M).
vecino3(F,C,M,M2):- A is F-1,B is C+1,posicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarMatriz(A,B,R,M,M2). %arriba-derecha
vecino3(_,_,M,M).
vecino4(F,C,M,M2):- A is F  ,B is C-1,posicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarMatriz(A,B,R,M,M2). %izquierda
vecino4(_,_,M,M).
vecino5(F,C,M,M2):- A is F  ,B is C+1,posicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarMatriz(A,B,R,M,M2). %derecha
vecino5(_,_,M,M).
vecino6(F,C,M,M2):- A is F+1,B is C-1,posicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarMatriz(A,B,R,M,M2). %abajo-izquierda
vecino6(_,_,M,M).
vecino7(F,C,M,M2):- A is F+1,B is C  ,posicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarMatriz(A,B,R,M,M2). %abajo
vecino7(_,_,M,M).
vecino8(F,C,M,M2):- A is F+1,B is C+1,posicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarMatriz(A,B,R,M,M2). %abajo-derecha
vecino8(_,_,M,M).

%*************************************** Mostrar Tablero

%Este metodo imprime la primera linea de '-', y llama a TableroMatriz para que pinte el resto.
%Calculamos la longitud del ancho de la matriz a partir de L para imprimir las lineas necesarias.
imprimeTablero([L|R]):- longitud(L,N),linea(N),nl,tableroMatriz([L|R]),!.

%Este metodo recursivo imprime linea a linea todas las filas de datos de la Matriz y su fila de '-' correspondiente.
%Calculamos la longitud del ancho de la matriz a partir de L para imprimir la fila de la longitud y formato necesarios,
%a continuación imprimimos una linea de separación igual a la inicial.
tableroMatriz([]).
tableroMatriz([L|R]):- longitud(L,N),tableroFila(L),nl,linea(N),nl,tableroMatriz(R).

%Pinta una linea de guiones, la cual utilizamos para las lineas horizontales; inicial, final e intermedias.
linea(1):- write('-'),write('-'),write('-').
linea(X):- Y is X-1, write('-'), write('-'), linea(Y).

%Pinta una fila del tablero separando cada valor con |, ademas de uno al inicio de la fila y otro al final.
tableroFila([]):- write('|').
tableroFila([I|R]):- write('|'),write(I),tableroFila(R).

%*************************************** Solicitar casilla



