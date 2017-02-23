
%****************INICIALIZACION DEL JUEGO DEL BUSCAMINAS************************
%Predicado que sirve para iniciar el juego.
jugar:-write('\nIndique el tamaño del tablero y el numero de bombas.\n'),filas.

%Comprobacion de numero de filas.
compFilas(X):-integer(X),between(9,24,X).

%Comprobacion de numero de filas.
compColumnas(Y):-integer(Y),between(9,30,Y).
%Leemos el numero de filas y comprobamos que este en los margenes, si es asi pedimos las columnas.Si no se vulven a pedir
filas:-repeat,write('\nNúmero de filas (9-24): '),read(X),compFilas(X),!,columnas(X).

%Leemos el numero de columnas y comprobamos que este en los margenes, si es asi pedimos las minas.Si no se vulven a pedir
columnas(X):-repeat,write('\nNúmero de columnas (9-30): '),read(Y),compColumnas(Y),!,minas(X,Y).

%Comprobacion del numero de minas.
compMinas(Z,X1):-integer(Z),(10<Z;10=Z),(Z<X1;Z=X1).

%leemos las minas de teclado y comprobamos que sea valido, encaso correcto creamos el tablero.El maximo de minas se calcula (X-1)*(Y-1) X=filas Y=Columnas
minas(X,Y):-X1 is (X-1)*(Y-1),repeat,write('\nNúmero de bombas (entre 10 y '),write(X1),write('): '),read(Z),compMinas(Z,X1),!,tableroJuego(X,Y,Z).


%mostramos tablero inicial y lo mostramos.
tableroJuego(X,Y,Z):-write('\nEste es el tablero inical: \n\n'),crearTablero(X,Y,Z).

%Creamos una lista vacia con la longitud adecuada
listaResul(0,X,X).
listaResul(X,Z,L):-X1 is X-1,(X1>0;X1=0),listaResul(X1,[' '|Z],L).

%Creamos una lista con campos 'X' para mostrar
listaBombas(0,X,X).
listaBombas(X,Z,L):-X1 is X-1,(X1>0;X1=0),listaBombas(X1,['X'|Z],L).

%Introducimos una mina y se concatena con la lista.
insertarPosi(X,Z,L,R):-append(L1,[Y|L2],L),A is Z-1,length(L1,A),append(L1,[X|L2],R).

%Se meten las minas en posiciones aleatorias(entre 1 y el producto de X e Y) en la lista vacia y devolvemos la lista con las minas dentro.
anadirBomba(0,Y,L,L).
anadirBomba(B,Tam,L,L1):-B>0,repeat,random(1,Tam,B),not(nth1(Z,L,'*')),!,insertarPosi('*',B,L,L2),B1 is B-1,anadirBomba(B1,Tam,L2,L1).

%Se crean dos listas, una para mostrar los resultados y otra donde se colocaran las minas para despues ir comparando las dos durante
%el juego.Despues se epiezan las consultas.
crearTablero(X,Y,Z):-X1 is X*Y,listaResul(X1,[],L1),listaMinas(X1,[],L2),cargarMinas(Z,X1,L1,L3),imprimir(X,Y,L2),Z1 is X1-Z,consultar(Z1,X,Y,L2,L3).


%*****************IMPRIMIR TABLERO DE JUEGO*************************************

%Linea de separacion de tamñao Y .
imprimirLinea(0):-write(' \n').
imprimirLinea(Y):-Y1 is Y-1,write('  '),imprimirLinea(Y1).

%Imprimimos una fila.
imprimirFilas(X,Y,0,L):-write(' |\n'),imprimir(X,Y,L).
imprimirFilas(X,Y,Y1,[Z|L]):-Y2 is Y1-1,write(' | '),write(Z),imprimirFilas(X,Y,Y2,L).

%Imprimimos el tablero inicial con las dimensiones de X e Y definidas por el usuario.
imprimir(0,Y,_):-imprimirLinea(Y).
imprimir(X,Y,L):-X1 is X-1,imprimirLinea(Y),Y1 is Y,imprimirFilas(X1,Y,Y1,L).

%*******************************************************************************
%************************** LOGICA DEL JUEGO ***********************************
%*******************************************************************************



%Se comprueba si estan todas las casillas que no tienen mina descubiertas,para ello se usa el contador Z,
%Si faltan por descubrir volvemos a pedir coordenadas neuvas, en caso contrario se acaba el juego con la victoria del jugador.
consultar(Z,X,Y,L,L1):-Z>0,write('\nSeleccione una posicion: .\n\n'),numFila(Z,X,Y,L,L1).
consultar(0,X,Y,L,L1):-imprimir(X,Y,L1),write('\n¡¡¡¡HA GANADO!!!!\n').

%PETICION DE NUMERO DE FILA.Se comprueba que sea menor que las filas definidas y que sea un numero.Despues se piden las columnas
numFila(Z,X,Y,L,L1):-repeat,write('Fila: '),read(X1),integer(X1),X1>0,(X1<X;X1=X),!,numColumna(X1,Z,X,Y,L,L1).

%%PETICON DE NUMERO DE COLUMNA.Se comprueba que sea menor que las columnas definidas y que sea un numero.Despues buscamos en la lista
numColumna(X1,Z,X,Y,L,L1):-repeat,write('Columna: '),read(Y1),integer(Y1),Y1>0,(Y1<Y;Y1=Y),!,buscarPos(X1,Y1,Z,X,Y,L,L1).

%Como se utiliza una lista simple como tamblero , se utiliza la siguiente formula para acceder a las coordenadas.
%((fila-1)*ColumnasTotales)+columna -> Convertir una matriz a un vector
%Z-> fila , V->columna , G-> casillas restantes, X-> filas totales, Y-> columnas totales.

buscarPos(Z,V,G,X,Y,L,L1):-X1 is ((Z-1)*Y)+V,nth1(X1,L1,'*'),mina.%Comprueba si hay una mina
buscarPos(Z,V,G,X,Y,L,L1):-X1 is ((Z-1)*Y)+V,not(nth1(X1,L,'X')),posRepetida,consultar(G,X,Y,L,L1). %En el caso que ya haya sido elegida

%Se comprueba cuantas minas hay en los alrrededores se muestra la nueva lista y se lanza consultar.
buscarPos(Z,V,G,X,Y,L,L1):-X1 is ((Z-1)*Y)+V,not(nth1(X1,L1,'*')),posArribaIzq(Z,V,X,Y,L1,W),cargarDatos(W,Z,V,G,G1,X,Y,L,L1,L2),imprimir(X,Y,L2),consultar(G1,X,Y,L2,L1).

%****Mensajes*******

%Mensage de posicion repetida
posRepetida:-write('Posicion ya elegida. Vuelva a intentarlo. \n').

%Mensage de mina
mina:-write('\n !HA EXPLOTADO UNA BOMBA¡ JUEGO FINALIZADO.\n').

%*********COMPROBACION DE ALRREDEDORES DE LA POSICION SELCCIONADA********

%W-> contador minas, Z-> filas, V-> columnas,G->casillas por descubrir,G1-> casillas sin bombas,X-> filas totales,Y-> Columnas totales
%comprobamos que valor hay en contador y decrementamos el contador de espacios sin descubrir sin mina
%El primero es para espacios en blanco, y el segundo para añadir el contador de bombas.

cargarDatos(0,Z,V,G,G1,X,Y,L,L1,L2):-X1 is ((Z-1)*Y)+V,insertarPosi(' ',X1,L,L3),G2 is G-1,arribaIzq(Z,V,G2,G1,X,Y,L3,L1,L2). %Si no hay minas a su alrededor ponemos un vacio y saltamos a la pocision superior izquierda
cargarDatos(W,Z,V,G,G1,X,Y,L,L1,L2):-W>0,X1 is ((Z-1)*Y)+V,insertarPosi(W,X1,L,L3),G2 is G-1,rellenar(G2,G1,L3,L2). %Si hay una o mas minas alrededor lo indicamos en la lista y la actualisamos


%Comprobamos la posicion superior izquierda, si existe se mira haber si hay una mina, si la hay se inicia el contador a 1 en caso contrario a 0
posArribaIzq(Z,V,X,Y,L1,W):-V-1>0,Z1 is Z-2,(Z1>0;Z1=0), X1 is (Z1*Y)+(V-1),nth1(X1,L1,'*'),posArriba(1,Z,V,X,Y,L1,W).
posArribaIzq(Z,V,X,Y,L1,W):-posArriba(0,Z,V,X,Y,L1,W).

%Comprobamos la posicion superior, si existe se mira haber si hay una mina, si la hay se incrementa el contador
posArriba(W,Z,V,X,Y,L1,G):-Z1 is Z-2,(Z1>0;Z1=0),X1 is (Z1*Y)+V,nth1(X1,L1,'*'),W1 is W+1,posArribaDer(W1,Z,V,X,Y,L1,G).
posArriba(W,Z,V,X,Y,L1,G):-posArribaDer(W,Z,V,X,Y,L1,G).

%Comprobamos la posicion superior derecha, si existe se mira haber si hay una mina, si la hay se incrementa el contador
posArribaDer(W,Z,V,X,Y,L1,G):-Y>V,Z1 is Z-2,(Z1>0;Z1=0),X1 is (Z1*Y)+(V+1),nth1(X1,L1,'*'),W1 is W+1,posDerecha(W1,Z,V,X,Y,L1,G).
posArribaDer(W,Z,V,X,Y,L1,G):-posDerecha(W,Z,V,X,Y,L1,G).

%Comprobamos la posicion derecha, si existe se mira haber si hay una mina, si la hay se incrementa el contador
posDerecha(W,Z,V,X,Y,L1,G):-Y>V,X1 is ((Z-1)*Y)+(V+1),nth1(X1,L1,'*'),W1 is W+1,posAbajoDer(W1,Z,V,X,Y,L1,G).
posDerecha(W,Z,V,X,Y,L1,G):-posAbajoDer(W,Z,V,X,Y,L1,G).

%Comprobamos la posicion inferior derecha, si existe se mira haber si hay una mina, si la hay se incrementa el contador
posAbajoDer(W,Z,V,X,Y,L1,G):-Y>V,X>Z,X1 is ((Z)*Y)+(V+1),nth1(X1,L1,'*'),W1 is W+1,posAbajo(W1,Z,V,X,Y,L1,G).
posAbajoDer(W,Z,V,X,Y,L1,G):-posAbajo(W,Z,V,X,Y,L1,G).

%Comprobamos la posicion inferior, si existe se mira haber si hay una mina, si la hay se incrementa el contador
posAbajo(W,Z,V,X,Y,L1,G):-X>Z,X1 is ((Z)*Y)+V,nth1(X1,L1,'*'),W1 is W+1,posAbajoIzq(W1,Z,V,X,Y,L1,G).
posAbajo(W,Z,V,X,Y,L1,G):-posAbajoIzq(W,Z,V,X,Y,L1,G).

%Comprobamos la posicion inferior izquierda, si existe se mira haber si hay una mina, si la hay se incrementa el contador
posAbajoIzq(W,Z,V,X,Y,L1,G):-V-1>0,X>Z,X1 is ((Z)*Y)+(V-1),nth1(X1,L1,'*'),W1 is W+1,posIzquierda(W1,Z,V,X,Y,L1,G).
posAbajoIzq(W,Z,V,X,Y,L1,G):-posIzquierda(W,Z,V,X,Y,L1,G).

%Comprobamos la posicion inferior izquierda, si existe se mira haber si hay una mina, si la hay se incrementa el contador y se devuelve en G
posIzquierda(W,Z,V,X,Y,L1,G):-V-1>0,X1 is ((Z-1)*Y)+(V-1),nth1(X1,L1,'*'),W1 is W+1,sustituir(W1,G).
posIzquierda(W,Z,V,X,Y,L1,G):-sustituir(W,G).

%copiamos un valor
sustituir(X,X).

%copiamos dos valores
rellenar(X,X,Y,Y).



%*********2ºCOMPROBACION PARA DETECTAR LOS ESPACIOS EN BLANCO************************

%Comprobamos la posicion superior izquierda, si existe se mira haber si esta descubierto, si no lo esta se cuentan las minas de alrrededor y se actualiza en la lista
arribaIzq(Z,V,G,G1,X,Y,L,L1,L2):-V-1>0,Z1 is Z-2,(Z1>0;Z1=0),X1 is (Z1*Y)+(V-1),nth1(X1,L,'X'),posArribaIzq(Z-1,V-1,X,Y,L1,W),cargarDatos(W,Z-1,V-1,G,G2,X,Y,L,L1,L3),arriba(Z,V,G2,G1,X,Y,L3,L1,L2).
arribaIzq(Z,V,G,G1,X,Y,L,L1,L2):-arriba(Z,V,G,G1,X,Y,L,L1,L2).

%Comprobamos la posicion superior, si existe se mira haber si esta descubierto, si no lo esta se cuentan las minas de alrrededor y se actualiza en la lista
arriba(Z,V,G,G1,X,Y,L,L1,L2):-Z1 is Z-2,(Z1>0;Z1=0),X1 is (Z1*Y)+V,nth1(X1,L,'X'),posArribaIzq(Z-1,V,X,Y,L1,W),cargarDatos(W,Z-1,V,G,G2,X,Y,L,L1,L3),arribaDer(Z,V,G2,G1,X,Y,L3,L1,L2).
arriba(Z,V,G,G1,X,Y,L,L1,L2):-arribaDer(Z,V,G,G1,X,Y,L,L1,L2).

%Comprobamos la posicion superior derecha, si existe se mira haber si esta descubierto, si no lo esta se cuentan las minas de alrrededor y se actualiza en la lista
arribaDer(Z,V,G,G1,X,Y,L,L1,L2):-Y>V,Z1 is Z-2,(Z1>0;Z1=0),X1 is (Z1*Y)+(V+1),nth1(X1,L,'X'),posArribaIzq(Z-1,V+1,X,Y,L1,W),cargarDatos(W,Z-1,V+1,G,G2,X,Y,L,L1,L3),derecha(Z,V,G2,G1,X,Y,L3,L1,L2).
arribaDer(Z,V,G,G1,X,Y,L,L1,L2):-derecha(Z,V,G,G1,X,Y,L,L1,L2).

%Comprobamos la posicion de la derecha, si existe se mira haber si esta descubierto, si no lo esta se cuentan las minas de alrrededor y se actualiza en la lista
derecha(Z,V,G,G1,X,Y,L,L1,L2):-Y>V,X1 is ((Z-1)*Y)+(V+1),nth1(X1,L,'X'),posArribaIzq(Z,V+1,X,Y,L1,W),cargarDatos(W,Z,V+1,G,G2,X,Y,L,L1,L3),abajoDer(Z,V,G2,G1,X,Y,L3,L1,L2).
derecha(Z,V,G,G1,X,Y,L,L1,L2):-abajoDer(Z,V,G,G1,X,Y,L,L1,L2).

%Comprobamos la posicion inferior derecha, si existe se mira haber si esta descubierto, si no lo esta se cuentan las minas de alrrededor y se actualiza en la lista
abajoDer(Z,V,G,G1,X,Y,L,L1,L2):-Y>V,X>Z,X1 is ((Z)*Y)+(V+1),nth1(X1,L,'X'),posArribaIzq(Z+1,V+1,X,Y,L1,W),cargarDatos(W,Z+1,V+1,G,G2,X,Y,L,L1,L3),abajo(Z,V,G2,G1,X,Y,L3,L1,L2).
abajoDer(Z,V,G,G1,X,Y,L,L1,L2):-abajo(Z,V,G,G1,X,Y,L,L1,L2).

%Comprobamos la posicion inferior, si existe se mira haber si esta descubierto, si no lo esta se cuentan las minas de alrrededor y se actualiza en la lista
abajo(Z,V,G,G1,X,Y,L,L1,L2):-X>Z,X1 is ((Z)*Y)+V,nth1(X1,L,'X'),posArribaIzq(Z+1,V,X,Y,L1,W), cargarDatos(W,Z+1,V,G,G2,X,Y,L,L1,L3),abajoIzq(Z,V,G2,G1,X,Y,L3,L1,L2).
abajo(Z,V,G,G1,X,Y,L,L1,L2):-abajoIzq(Z,V,G,G1,X,Y,L,L1,L2).

%Comprobamos la posicion inferior izquierda, si existe se mira haber si esta descubierto, si no lo esta se cuentan las minas de alrrededor y se actualiza en la lista
abajoIzq(Z,V,G,G1,X,Y,L,L1,L2):-V-1>0,X>Z,X1 is ((Z)*Y)+(V-1),nth1(X1,L,'X'),posArribaIzq(Z+1,V-1,X,Y,L1,W),cargarDatos(W,Z+1,V-1,G,G2,X,Y,L,L1,L3),izquierda(Z,V,G2,G1,X,Y,L3,L1,L2).
abajoIzq(Z,V,G,G1,X,Y,L,L1,L2):-izquierda(Z,V,G,G1,X,Y,L,L1,L2).

%Comprobamos la posicion de la izquierda, si existe se mira haber si esta descubierto, si no lo esta se cuentan las minas de alrrededor y se actualiza en la lista
izquierda(Z,V,G,G1,X,Y,L,L1,L2):-V-1>0,X1 is ((Z-1)*Y)+(V-1),nth1(X1,L,'X'),posArribaIzq(Z,V-1,X,Y,L1,W),cargarDatos(W,Z,V-1,G,G1,X,Y,L,L1,L2).
izquierda(Z,V,G,G1,X,Y,L,L1,L2):-rellenar(G,G1,L,L2).



