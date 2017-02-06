%PECL1: Buscaminas en prolog
%Autores:
         %Ángel Gonzalo Yunta   DNI 53564426W    correo:a.gonzalo@edu.uah.es
         %Ruben Escobar Castel  DNI 53566640P    correo:r.escobar@edu.uah.es

%Fecha: 14 Marzo 2013


%-------------------------------------- DEPURACION DE DATOS -----------------------------------------%

%Depuracion de los datos de entrada, tienen que ser integer y estar en los rangos.
comprobarFila(X):- integer(X),between(9,24,X).      %,not(integer(X)),errorInteger,not(between(9,24,X)),errorRango.
comprobarColumna(Y):- integer(Y),between(9,30,Y).
comprobarBombas(X,Y,Z):- integer(Z),F is((X-1)*(Y-1)),between(10,F,Z).

%Depuracion de los datos de entrada para cada jugada, tienen que ser integer y
%estar entre 1 y los valores de fila(X) o columna(Y) dados en los datos iniciales.
%X->Fila Y->Columna J->FilaJugada H->ColumnaJugada
comprobarFilaSeleccionada(X,J):- integer(J), between(1,X,J).
comprobarColumnaSeleccionada(Y,H):- integer(H), between(1,Y,H).

%Comprueba si la jugada (coordenada X-Y) ya ha sido seleccionada antes
comprobarJugada(X,Y,MBooleans):- obtenerPosicionMatriz(X,Y,MBooleans,'F').


%---------------------------------------- CAPTURA DE DATOS --------------------------------------------%

%Captura de datos inicial para creacion del tablero, utilizando repeat para crear un bucle infinito mientras
%que no se introduzca un dato correcto. X->Filas Y->Columnas Z->Bombas
leerFila(X):- repeat,write('Número de filas (entre 9 y 24):'),read(X),comprobarFila(X),!.
leerColumna(Y):- repeat,write('Número de columnas (entre 9 y 30):'),read(Y),comprobarColumna(Y),!.
leerBombas(X,Y,Z):- repeat,write('Número de bombas (entre 10 y 81):'),read(Z),comprobarBombas(X,Y,Z),!.

%Captura de datos para cada jugada
pideFila(X,J):- repeat,write('Fila: '),read(V),J is V-1,comprobarFilaSeleccionada(X,V),!.
pideColumna(Y,H):- repeat,write('Columna: '),read(W),H is W-1,comprobarColumnaSeleccionada(Y,W),!.


%----------------------------------- METODOS AUXILIARES DE MANEJO DE LISTAS ------------------------------------%

%Con este metodo comprobamos si un valor es 0 o no.
cero(0):- true.
cero(_):- false.

%Con este metodo comprobamos si un valor es T (true), o F (false).
esTrue('T'):- true.
esTrue('F'):- false.

%Metodo que nos devuelve la longitud de la lista pasada por referencia. longitud(L,N).
longitud([],0).
longitud([_|T],N):-longitud(T,M), N is M+1.

%Comprueba si un termino 'X' esta dentro de la lista L. esta(X,L).
esta(X,[X|_]).
esta(X,[_|Cola]) :- esta(X,Cola). 

%Obtener la posicion de una lista
%La posicion 0 de una lista es la cabeza
%La posicion Pos de una lista es recursion: no es la cabeza, asi que obtenerPosicion de Pos-1 de T.
obtenerPosicion(0,[H|_],H).
obtenerPosicion(Pos,[_|T],L):- X is Pos-1, obtenerPosicion(X,T,L).

%Obtener la posicion de una matriz
%Para la posicion de una matriz: obtenemos primero la posicion de la Fila en la lista T y la metemos en Lista.
%Una vez encontrada la posicion de la fila, buscamos la de la columna en dicha Lista y la metemos en L.
obtenerPosicionMatriz(F,C,T,L):- obtenerPosicion(F,T,Lista), obtenerPosicion(C,Lista,L).

%Insertar un valor en una posicion de una lista determinada
%Insertar V en la posicion 0 de una lista es modificar la cabeza
%Insertar V en la posicion Pos de una lista es quitar la cabeza, reducir Pos en 1 y recursion.
insertarEnPosicion(0,V,[_|T],[V|T]).
insertarEnPosicion(Pos,V,[H|T],[H|L]):- X is Pos-1,insertarEnPosicion(X,V,T,L).

%Insertar un valor en una posicion de una matriz determinada
%Insertar V en la posicion Fila-Columna de una matriz es: obtener la posicion de la fila que buscamos y en su columna insertamos V obteniendo Lista2.
%Una vez tenemos Lista2, insertamos en la fila la nueva Lista2, creando Lista.
insertarEnMatriz(Fila,Columna,V,L,Lista):- obtenerPosicion(Fila,L,Auxiliar),insertarEnPosicion(Columna,V,Auxiliar,Lista2),insertarEnPosicion(Fila,Lista2,L,Lista).

%Funcion para tomar un entero de una lista y convertirlo en entero puro.
preprocesar(X,X):-atomic(X),!.
preprocesar(L,X):-obtenerPosicion(0,L,X).

%Sumar una unidad al valor X devolviendolo en R.
sucesor(X,R):- R is X+1.


%-------------------------------- CREACION DEL TABLERO -----------------------------------%

%Inserta un elemento X al inicio de una lista Ys dando una lista Zs
insertar(X,[],[X]).
insertar(X,[Y|Ys],[Y|Zs]):-insertar(X,Ys,Zs),!.

%Inserta el valor X al final de la lista L y lo devuelve en L1.
insertarFin(X,[],[X]).
insertarFin(X,[C|L],[C|L1]):-insertarFin(X,L,L1).

%Crea una lista 'Lista' de tamaño X con valores V.
crearLista(0,_,_).
crearLista(X,V,Lista):- Y is X -1, crearLista(Y,V,L),insertar(V,L,Lista),!.

%Crea una matriz de XxY rellena de V.
%X son las filas, Y son las columnas, V es el valor, Matriz es la lista de listas
%Mismo proceso que listas: creas lista de valores V y tamaño Y en L y despues insertar la lista L en la lista M dando la lista Matriz.
crearMatriz(0,_,_,_).
crearMatriz(X,Y,V,Matriz):- Z is X-1, crearMatriz(Z,Y,V,M),crearLista(Y,V,L), insertar(L,M,Matriz),!.

%Va modificando el tablero del usuario segun las coordenadas que le pase el jugador
actualizaTablero(J,H,M1,M2,M3,MF,M3F,Jugada,JugadaRes):- obtenerPosicionMatriz(J,H,M1,V),esCero(J,H,V,M1,M2,M3,MF,M3F,Jugada,JugadaRes).

%Comprueba si un valor es 0, y si lo es expande hacia los vecinos posibles.
%J->Fila de la Jugada, H->Columna de la Jugada, V->Valor de dicha posicion.
%Si no es cero el valor, hacemos las inserciones en las matrices de Juego y Booleanos y devolvemos una jugada menos,
%en caso de ser cero, hacemos dichas inserciones, decrementamos el numero de jugadas, y llamamos al metodo listaVecinos
%para que nos cree una lista de los vecinos de dicha casilla. Una vez creada dicha lista, se la pasamos a llamaVecinos
%junto con algunos parámetros mas para que realice las llamadas necesarias sobre los vecinos.
esCero(J,H,V,_,MatrizJugada,MatrizBool,MatrizFinal,MatrizFinalBool,Jugada,JugadaR):- \+cero(V),insertarEnMatriz(J,H,V,MatrizJugada,MatrizFinal),insertarEnMatriz(J,H,'T',MatrizBool,MatrizFinalBool)
                                                                            ,JugadaR is Jugada-1.

esCero(J,H,V,MatrizBombas,MatrizJugada,MatrizBool,MatrizFinal,MatrizFinalBool,Jugada,JugadaR):- cero(V),insertarEnMatriz(J,H,V,MatrizJugada,MatrizAux)
                                                                                         ,insertarEnMatriz(J,H,'T',MatrizBool,MatrizAuxBool)
                                                                                         ,listaVecinos(J,H,[],LF,MatrizBool)
                                                                                         ,JugadaAux is Jugada-1
                                                                                         ,llamaVecinos(J,H,MatrizBombas,MatrizAux,MatrizAuxBool,MatrizFinal,MatrizFinalBool,LF,JugadaAux,JugadaR).

%J->Fila de la Jugada, H->Columna de la Jugada, V->Valor de dicha posicion,M1->Bombas, M2->Juego, M3->Booleanos, MF->Juego despues de 'mover', M3F->Booleanos despues de 'mover'.
%Recogemos la lista de vecinos que se nos ha pasado y desapilamos el primer elemento. Lo tratamos y sacamos el par de coordenadas que contiene.
%Después, comprobamos que valor contiene, si es un numero, hacemos las inserciones en las matrices de juego y bool y devolvemos sus respectivas
%matrices modificadas, realizando la llamada recursiva a llamaVecinos (Restando una Jugada, con las matrices resultantes de la modificación, y
%con la lista de vecinos habiendole desapilado el primer elemento, que es el que tratamos en esta parte). Si es un cero, realizamos la misma operación,
%además de añadir los vecinos de dicho cero a la lista (al final, para guardar el orden).
llamaVecinos(_,_,_,MF,M3F,MF,M3F,[],JugadaR,JugadaR).
llamaVecinos(J,H,M1,M2,M3,MF,M3F,[C|R],Jugada,JugadaR):- procesar(C,N,M),obtenerPosicionMatriz(N,M,M1,V)
                                              ,\+cero(V),insertarEnMatriz(N,M,V,M2,MA),insertarEnMatriz(N,M,'T',M3,M3A)
                                              ,JugadaAux is Jugada-1,llamaVecinos(J,H,M1,MA,M3A,MF,M3F,R,JugadaAux,JugadaR).

llamaVecinos(J,H,M1,M2,M3,MF,M3F,[C|R],Jugada,JugadaR):- procesar(C,N,M),obtenerPosicionMatriz(N,M,M1,V)
                                              ,cero(V),insertarEnMatriz(N,M,V,M2,MA),insertarEnMatriz(N,M,'T',M3,M3A)
                                              ,listaVecinos(N,M,R,RF,M3A),JugadaAux is Jugada-1,llamaVecinos(J,H,M1,MA,M3A,MF,M3F,RF,JugadaAux,JugadaR).

%Coge la lista de dos valores y nos devuelve cada uno de ellos en una variable
procesar([X,Y],Z,W):- Z is X, W is Y.

%Genera una lista de los vecinos posibles de una casilla, descartando aquellos que esten fuera del rango de la matriz facilitada,
%o ya hayan sido visitados anteriormente. F->Fila Jugada, C->Columna Jugada, Lista->Lista de Vecinos
%ListaFin->Lista de vecinos Resultante de añadir los vecinos oportunos, M3->Matriz de Booleanos.
listaVecinos(F,C,Lista,ListaFin,M3):- v01(F,C,Lista,L1,M3)
                                      ,v02(F,C,L1,L2,M3)
                                      ,v03(F,C,L2,L3,M3)
                                      ,v04(F,C,L3,L4,M3)
                                      ,v05(F,C,L4,L5,M3)
                                      ,v06(F,C,L5,L6,M3)
                                      ,v07(F,C,L6,L7,M3)
                                      ,v08(F,C,L7,ListaFin,M3),!.

%En cada uno de los vecinos comprobamos que el valor de las coordenadas esta dentro del rango de la matriz de Booleanos, a la vez que
%comprobamos que su valor es F(false). Además, comprobamos que no esté ya en la lista de vecinos. Si todo eso da negativo, lo añadimos,
%sino, devolvemos la lista, tal y como se nos paso por referencia.
v01(F,C,L,LF,M3):- A is F-1,B is C-1,A>=0,B>=0, obtenerPosicionMatriz(A,B,M3,V), \+esTrue(V), \+esta([A,B],L), insertarFin([A,B],L,LF).
v01(_,_,L,L,_).
v02(F,C,L,LF,M3):- A is F-1,B is C  ,A>=0,B>=0, obtenerPosicionMatriz(A,B,M3,V), \+esTrue(V), \+esta([A,B],L), insertarFin([A,B],L,LF).
v02(_,_,L,L,_).
v03(F,C,L,LF,M3):- A is F-1,B is C+1,A>=0,B>=0, obtenerPosicionMatriz(A,B,M3,V), \+esTrue(V), \+esta([A,B],L), insertarFin([A,B],L,LF).
v03(_,_,L,L,_).
v04(F,C,L,LF,M3):- A is F  ,B is C-1,A>=0,B>=0, obtenerPosicionMatriz(A,B,M3,V), \+esTrue(V), \+esta([A,B],L), insertarFin([A,B],L,LF).
v04(_,_,L,L,_).
v05(F,C,L,LF,M3):- A is F  ,B is C+1,A>=0,B>=0, obtenerPosicionMatriz(A,B,M3,V), \+esTrue(V), \+esta([A,B],L), insertarFin([A,B],L,LF).
v05(_,_,L,L,_).
v06(F,C,L,LF,M3):- A is F+1,B is C-1,A>=0,B>=0, obtenerPosicionMatriz(A,B,M3,V), \+esTrue(V), \+esta([A,B],L), insertarFin([A,B],L,LF).
v06(_,_,L,L,_).
v07(F,C,L,LF,M3):- A is F+1,B is C  ,A>=0,B>=0, obtenerPosicionMatriz(A,B,M3,V), \+esTrue(V), \+esta([A,B],L), insertarFin([A,B],L,LF).
v07(_,_,L,L,_).
v08(F,C,L,LF,M3):- A is F+1,B is C+1,A>=0,B>=0, obtenerPosicionMatriz(A,B,M3,V), \+esTrue(V), \+esta([A,B],L), insertarFin([A,B],L,LF).
v08(_,_,L,L,_).


%----------------------------------- IMPRESION DE TABLEROS --------------------------------------%

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


%----------------------------------- CREACION DE MINAS ALEATORIAS --------------------------------------%

%Crea el tablero relleno con las Bombas colocadas aleatoriamente, además de los numeros correspondientes al
%número de bombas contiguas a la casilla. Se le pasa como parametro N->Nº Bombas, Filas-Columnas->Dimension de la matriz
%M->Matriz rellena de ceros. Y nos devuelve la resultante en Matriz.
tableroBombas(0,_,_,Matriz,Matriz).
tableroBombas(N,Filas,Columnas,M,Matriz):- anadirMina(Filas,Columnas,F,C,M),insertarEnMatriz(F,C,'B',M,MatrizAux)
                                           ,H is N-1,vecinosTotales(F,C,MatrizAux,MFB),tableroBombas(H,Filas,Columnas,MFB,Matriz),!.

%Se le pasan las coordenadas aleatorias y añade la mina en la matriz M, comprobando que no esté ya.
%Creamos valores aleatorios entre 0 y Filas, Columnas para que esten dentro del rango de la matriz M.
%El metodo se repide hasta que de true, es decir, si se repite una posición de mina, vuelve a ejecutarse
%para no sobreponer minas. Se añadira la mina (letras 'B') en la Fila F y Columna C de la matriz M.
anadirMina(Filas,Columnas,F,C,M):- repeat, coordMina(Filas,Columnas,F,C),\+(obtenerPosicionMatriz(F,C,M,'B')),!.
                                                                                   
%Nos da un valor V, aleatorio, entre el 0 y el maximo (asi no puede estar fuera del rango de filas-columnas).
aleatorio(Maximo,V):- M is Maximo, random(0,M,V).
 
%Nos da la coordenada en fila(F)-columna(C) de la localizacion de una bomba.
coordMina(Filas,Columnas,F,C):- aleatorio(Filas,F),aleatorio(Columnas,C).


% --------------------------------------------- VECINOS --------------------------------------------------------%

%Mira los vecinos de la coordenada de la bomba, y devuelve en M2 la matriz con las iteraciones sobre las casillas de los vecinos
%realizadas. Si se encuentra una bomba o se intenta acceder a una casilla inexistente en la matriz, no se hace nada.
vecinosTotales(F,C,M,M2):- vecino1(F,C,M,M1)
                                        ,vecino2(F,C,M1,M3)
                                        ,vecino3(F,C,M3,M4)
                                        ,vecino4(F,C,M4,M5)
                                        ,vecino5(F,C,M5,M6)
                                        ,vecino6(F,C,M6,M7)
                                        ,vecino7(F,C,M7,M8)
                                        ,vecino8(F,C,M8,M2),!.

%Cada uno de los vecinos recoge el valor de una de las casillas contiguas a las coordenadas F-C, la pasa de lista a entero mediante preprocesar, y
% le suma 1 con el sucesor. Ese valor resultante, lo insertamos en la matriz M devolviendola modificada en M2.
vecino1(F,C,M,M2):- A is F-1,B is C-1,obtenerPosicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarEnMatriz(A,B,R,M,M2). %arriba-izquierda
vecino1(_,_,M,M).
vecino2(F,C,M,M2):- A is F-1,B is C  ,obtenerPosicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarEnMatriz(A,B,R,M,M2). %arriba
vecino2(_,_,M,M).
vecino3(F,C,M,M2):- A is F-1,B is C+1,obtenerPosicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarEnMatriz(A,B,R,M,M2). %arriba-derecha
vecino3(_,_,M,M).
vecino4(F,C,M,M2):- A is F  ,B is C-1,obtenerPosicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarEnMatriz(A,B,R,M,M2). %izquierda
vecino4(_,_,M,M).
vecino5(F,C,M,M2):- A is F  ,B is C+1,obtenerPosicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarEnMatriz(A,B,R,M,M2). %derecha
vecino5(_,_,M,M).
vecino6(F,C,M,M2):- A is F+1,B is C-1,obtenerPosicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarEnMatriz(A,B,R,M,M2). %abajo-izquierda
vecino6(_,_,M,M).
vecino7(F,C,M,M2):- A is F+1,B is C  ,obtenerPosicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarEnMatriz(A,B,R,M,M2). %abajo
vecino7(_,_,M,M).
vecino8(F,C,M,M2):- A is F+1,B is C+1,obtenerPosicionMatriz(A,B,M,L),preprocesar(L,X),integer(X),sucesor(X,R),insertarEnMatriz(A,B,R,M,M2). %abajo-derecha
vecino8(_,_,M,M).


%----------------------------------- REGLAS QUE GUíAN AL JUGADOR --------------------------------------%

%Pide la casilla para avanzar el juego, pasandosela a muestraTablero, junto con otras variables necesarias.
%Después imprime las jugadas restantes y hace recursión sobre si mismo con los valores indicados.
%Jugada->Jugadas restantes de la partida ,X->Filas de la Matriz ,Y->Columnas de la Matriz ,J->FilaJugada ,H->ColumnaJugada.
%M1->Matriz de Bombas ,M2->Matriz de Juego ,M3->Matriz de Booleanos ,MF->Matriz Final de Juego ,M3F->Matriz Final de Booleanos.
pideJugada(0,_,_,_,_,M1,_,_,_,_):- nl,write('¡FINAL DE LA PARTIDA, HAS GANADO!'),nl,imprimeTablero(M1).
pideJugada(Jugada,X,Y,J,H,M1,M2,M3,MF,M3F):- recogeDatos(X,Y,J,H,M3),\+(miraSiEsBomba(J,H,M1)),muestraTablero(J,H,M1,M2,M3,MF,M3F,Jugada,JugadaRes)
                     ,write(JugadaRes),write(' Jugadas restantes'),pideJugada(JugadaRes,X,Y,_,_,M1,MF,M3F,_,_).

%Este metodo recoge la Fila y Columnas de la jugada, repitiendo la petición si es una jugada repetida.
recogeDatos(X,Y,J,H,M3):-  repeat,nl,write('Pinche sobre una posicion del tablero. Recuerde escribir un punto detras de cada número.'),nl
                     ,pideFila(X,J),pideColumna(Y,H),comprobarJugada(J,H,M3),!.

%Mira si una celda es bomba, y en caso afirmativo termina el juego y muestra un mensaje de JUEGO FINALIZADO.
miraSiEsBomba(X,Y,M):- obtenerPosicionMatriz(X,Y,M,'B'),nl,write('JUEGO FINALIZADO'),nl,write('HA PISADO UNA MINA!'),nl,imprimeTablero(M).

%Muestra el tablero tras una jugada. Llama a ActualizaTablero que es el encargado de realizar el grueso de cómputos del programa,
%y después imprime los tableros resultantes (Imprime el Tablero resultante de la Jugada y el tablero Maestro con la solución para poder llevar el seguimiento).
muestraTablero(J,H,M1,M2,M3,MF,M3F,Jugada,JugadaRes):- write('Así queda su tablero: '),nl,actualizaTablero(J,H,M1,M2,M3,MF,M3F,Jugada,JugadaRes)
                                                       ,imprimeTablero(MF),imprimeTablero(M1),nl.

%Regla inicial, desde la que llamamos a las reglas de lectura de datos, creamos las matrices iniciales
%tanto de juego, como de Bombas y Booleanos; y por ultimo, llamamos al metodo de jugada.
jugar:- write('Elija el tamaño del tablero y el número de bombas. No se olvide de escribir cada número seguido de un punto.')
        ,nl,leerFila(X),leerColumna(Y),leerBombas(X,Y,Z),nl,write('Este es el tablero inicial')
        ,nl,crearMatriz(X,Y,'x',Inicial),crearMatriz(X,Y,0,Bombas),imprimeTablero(Inicial),nl
        ,tableroBombas(Z,X,Y,Bombas,BombasAux),imprimeTablero(BombasAux),nl
        ,crearMatriz(X,Y,'F',Bool),Jugada is ((X*Y)-Z),pideJugada(Jugada,X,Y,_,_,BombasAux,Inicial,Bool,_,_).
