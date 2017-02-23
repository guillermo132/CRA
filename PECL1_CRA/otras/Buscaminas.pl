jugar:-
       modo_juego(NumFilas,NumColumnas,NumBombas),
       rellenarTablero(Lista, NumColumnas,NumFilas),
       mostrarTablero(Lista,NumColumnas),
       posicionarBombas(NumBombas,NumFilas,NumColumnas,CoordenadasBombas),
       ponerBombas(Lista,CoordenadasBombas,ListaBombas),
       write('\n\n\n\n\n'),
       mostrarTablero(ListaBombas,NumColumnas),
       pedirCoor(Lista,ListaBombas,NumColumnas,NumFilas,NumBombas),!.


pedirCoor(Lista,ListaBombas,NumColumnas,NumFilas,NumBombas):-
             ganado(ListaBombas,R),
             R==0,
             write('\n\n\n\t********************************************'),
             write('\n\t*** FELICIDADES HA GANADO USTED EL JUEGO ***'),
             write('\n\t*************** BUEN TRABAJO ***************'),
             write('\n\t********************************************').

pedirCoor(Lista,ListaBombas,NumColumnas,NumFilas,NumBombas):-
             ganado(ListaBombas,R),
             R==1,
             pedirCoordenada(NumColumnas,NumFilas,Fila,Columna),
             logicaJuego(Lista,ListaBombas, NumColumnas,NumFilas,NumBombas,Fila,Columna,Ret,Lista2,ListaBombas2),
             evaluarLogica(Lista2,ListaBombas2, NumColumnas,NumFilas,NumBombas, Ret),!.


logicaJuego(Lista,ListaBombas, NumColumnas,NumFilas,NumBombas,Fila,Columna, Ret,Lista,ListaBombas):-
             Fila<0;
             Fila>=NumFilas;
             Columna<0;
             Columna>=NumColumnas.
             
logicaJuego(Lista,ListaBombas, NumColumnas,NumFilas,NumBombas,Fila,Columna,Ret,Lista2,ListaBombas2):-
             bombasLados(ListaBombas,Fila,Columna,NumFilas,NumColumnas,B),
             logicaJuego_aux(Lista,ListaBombas,Fila,Columna,NumFilas,NumColumnas,B, Ret,Lista2,ListaBombas2).

evaluarLogica(Lista2,ListaBombas, NumColumnas,NumFilas,NumBombas, Ret):-
             Ret == -1,
             pedirCoor(Lista2,ListaBombas, NumColumnas,NumFilas,NumBombas).

evaluarLogica(Lista2,ListaBombas, NumColumnas,NumFilas,NumBombas, Ret):-
             Ret == 0,
             write('\nAsí queda su tablero:\n\n'),
             mostrarTablero(Lista2,NumColumnas),
             pedirCoor(Lista2,ListaBombas, NumColumnas,NumFilas,NumBombas).


evaluarLogica(_,_,_,_,_,_).


logicaJuego_aux(Lista,ListaBombas,Fila,Columna,NumFilas,NumColumnas,B, Ret,Lista,ListaBombas):-
             B == -2,
             write('\n\t  Ha pinchado una posición ya descubierta. Vuelva a intentarlo'),
             Ret is -1, !.

logicaJuego_aux(Lista,ListaBombas,Fila,Columna,NumFilas,NumColumnas,B, Ret,RetLista,RetListaBombas):-
             B == -1,
             write('\n¡¡¡¡¡BOOOOOOOOOMBAAAAAAAAA!!!!! El juego ha terminado.'),
             RetLista = [],
             RetListaBombas = [],
             Ret is 1, !.

logicaJuego_aux(Lista,ListaBombas,Fila,Columna,NumFilas,NumColumnas,B, Ret,RetLista,RetListaBombas):-
             B == 0,
             modificar_matriz(Fila,Columna,ListaBombas,' ',ListaBombas2),
             modificar_matriz(Fila,Columna,Lista,' ',Lista2),
             
             Fila1 is Fila+1,
             Fila2 is Fila-1,
             Columna1 is Columna+1,
             Columna2 is Columna-1,

             expandir_libres(Lista2,ListaBombas2, NumColumnas,NumFilas,NumBombas,Fila1,Columna1, _,RetLista0,RetListaBombas0),
             expandir_libres(RetLista0,RetListaBombas0, NumColumnas,NumFilas,NumBombas,Fila1,Columna,_,RetLista1,RetListaBombas1),
             expandir_libres(RetLista1,RetListaBombas1, NumColumnas,NumFilas,NumBombas,Fila1,Columna2, _,RetLista2,RetListaBombas2),

             expandir_libres(RetLista2,RetListaBombas2, NumColumnas,NumFilas,NumBombas,Fila2,Columna, _,RetLista3,RetListaBombas3),



             expandir_libres(RetLista3,RetListaBombas3, NumColumnas,NumFilas,NumBombas,Fila,Columna2, _,RetLista4,RetListaBombas4),

             expandir_libres(RetLista4,RetListaBombas4, NumColumnas,NumFilas,NumBombas,Fila2,Columna2, _,RetLista5,RetListaBombas5),
             expandir_libres(RetLista5,RetListaBombas5, NumColumnas,NumFilas,NumBombas,Fila,Columna1, _,RetLista6,RetListaBombas6),
             expandir_libres(RetLista6,RetListaBombas6, NumColumnas,NumFilas,NumBombas,Fila2,Columna1, _,RetLista,RetListaBombas),

             Ret is 0.

logicaJuego_aux(Lista,ListaBombas,Fila,Columna,NumFilas,NumColumnas,B, Ret,RetLista,RetListaBombas):-
             modificar_matriz(Fila,Columna,ListaBombas,' ',RetListaBombas),
             modificar_matriz(Fila,Columna,Lista,B,RetLista),
             Ret is 0.

expandir_libres(Lista,ListaBombas, NumColumnas,NumFilas,NumBombas,Fila,Columna,Ret,Lista,ListaBombas) :-
             Fila<0;
             Fila>=NumFilas;
             Columna<0;
             Columna>=NumColumnas.

expandir_libres(Lista,ListaBombas, NumColumnas,NumFilas,NumBombas,Fila,Columna,Ret,Lista2,ListaBombas2) :-
             bombasLados(ListaBombas,Fila,Columna,NumFilas,NumColumnas,B),
             expandir_libres_aux(Lista,ListaBombas, NumColumnas,NumFilas,NumBombas,Fila,Columna, _,Lista2,ListaBombas2,B).

expandir_libres_aux(Lista,ListaBombas, NumColumnas,NumFilas,NumBombas,Fila,Columna,Ret,Lista,ListaBombas, B):-
              B==(-2);
              B==(-1).
expandir_libres_aux(Lista,ListaBombas, NumColumnas,NumFilas,NumBombas,Fila,Columna,Ret,Lista2,ListaBombas2,B) :-
             B\=(-2),
             logicaJuego(Lista,ListaBombas, NumColumnas,NumFilas,NumBombas,Fila,Columna, _,Lista2,ListaBombas2),!.


%%Elegir el modo de juego
modo_juego(NumFilas,NumColumnas,NumBombas):-
              write('\nElija el modo de juego:'),
              write('\n\t1.Facil'),
              write('\n\t2.Medio'),
              write('\n\t3.Dificil'),
              write('\n\t4.Personalizado\n\t->'),
              read(Mod),
              elegir(NumFilas,NumColumnas,NumBombas,Mod).

elegir(NumFilas,NumColumnas,NumBombas,Mod):-
              Mod=:=1,
              write('\n\nHa elegido el modo de juego Facil\n'),
              NumColumnas is 9,
              NumFilas is 9,
              NumBombas is 10.

elegir(NumFilas,NumColumnas,NumBombas,Mod):-
              Mod=:=2,
              write('\n\nHa elegido el modo de juego Medio\n'),
              NumColumnas is 16,
              NumFilas is 16,
              NumBombas is 40.

elegir(NumFilas,NumColumnas,NumBombas,Mod):-
              Mod=:=3,
              write('\n\nHa elegido el modo de juego Dificil\n'),
              NumColumnas is 30,
              NumFilas is 16,
              NumBombas is 99.

elegir(NumFilas,NumColumnas,NumBombas,Mod):-
              Mod=:=4,
              write('\n\nHa elegido el modo de juego Personalizado\n'),
              pedirFilas(NumFilas),
              pedirColumnas(NumColumnas),
              pedirBombas(NumFilas, NumColumnas, NumBombas).

%%Pedir datos
pedirFilas(NumFilas) :- repeat,
              write('\nNúmero de filas (entre 9 y 24): '),
              read(NumFilas),
              integer(NumFilas) ,
              NumFilas >= 9,
              NumFilas =< 24,
              !.

pedirColumnas(NumColumnas) :- repeat,
              write('\nNúmero de columnas (entre 9 y 30): '),
              read(NumColumnas),
              integer(NumColumnas),
              NumColumnas >= 9,
              NumColumnas =< 30,
              !.
              
pedirBombas(NumColumnas,NumFilas, NumBombas) :- repeat,
               MaxBombas is (NumColumnas - 1)*(NumFilas - 1),
               write('\nNúmero de bombas (entre 10 y '),
               write(MaxBombas),
               write('):'),
               read(NumBombas),
               integer(NumBombas),
               NumBombas >= 10,
               NumBombas =< MaxBombas,

               !.

pedirCoordenada(NumColumnas,NumFilas,Fila,Columna):-
               write('\n\nPinche sobre una posición del tablero. Recuerde escribir un punto tras cada número.'),
               repeat,
               write('\nFila: '),
               read(Fila),
               integer(Fila),
               %Fila>=0,
               Fila<NumFilas,
               !,
               repeat,
               write('   Columna: '),
               read(Columna),
               integer(Columna),
               Columna>=0,
               Columna<NumColumnas,
               !.

%%Rellenar el tablero
rellenarTablero(Lista, NumColumnas, NumFilas) :-
                        crearColumna(Lista, NumFilas, NumColumnas).
                                      
crearColumna(Lista, NumFilas, NumColumnas) :-
                    crearColumnaAux(Lista, NumFilas, [], NumColumnas),
                    !.
                    
crearColumnaAux(ListaCol, Rest, ListaColAux, NumColumnas):-
                          Rest > 0,
                          RestX is Rest-1,
                          crearFila(ListaFila, NumColumnas),
                          crearColumnaAux(ListaCol, RestX, [ListaFila|ListaColAux], NumColumnas).
                          
crearColumnaAux(ListaCol, _, ListaCol, _).

crearFila(Lista, NumColumnas ) :-
   crearFilaAux(Lista, NumColumnas, []),
   !.
   
crearFilaAux(Lista, Rest, Li staAux) :-
                      Rest > 0,
                      RestX is Rest-1,
                      crearFilaAux(Lista, RestX, [x|ListaAux]).
crearFilaAux(ListaAux, _, ListaAux).



%%Mostrar tablero.
mostrarTablero([X|Lista],NumColumnas) :-
                            escribir_rayas(NumColumnas),
                            write('\n'),
                            mostrarTableroFila(X),
                            write('\n'),
                            mostrarTablero(Lista,NumColumnas).
mostrarTablero([],NumColumnas):-escribir_rayas(NumColumnas).
                             
mostrarTableroFila([X|Lista]) :-
                             write('|'),
                             write(X),
                             mostrarTableroFila(Lista).
mostrarTableroFila([]):- write('|').

escribir_rayas(Columnas):-
                         Columnas=:=0,
                         write('-'),
                         !.
                         
escribir_rayas(Columnas):-
                         write('--'),
                         NuevaCol is Columnas-1,
                         escribir_rayas(NuevaCol).
                         
%%Modificar_matriz(Fila,Columna,ListaOriginal,DatoNuevo,ListadoModificado)  **Recordar que Filas y Columnas empiezan en 0**
modificar_matriz(F,C,Lista,Dato,List):-
                          modificar_matriz_aux(F,C,Lista,Dato,[],List),
                          !.

modificar_matriz_aux(F,C,Lista,Dato,L,List):-
                          length(Lista,X),
                          F>=X,
                          !.
                          
modificar_matriz_aux(F,C,[D|Lista],Dato,L,List):-
                          F=:=0,
                          modificar_lista(C,D,Dato,DMod),
                          append(L,[DMod|Lista],List).
                          
modificar_matriz_aux(F,C,[D|Lista],Dato,L,List):-
                          F=\=0,
                          length(Lista,X),
                          F=<X,
                          append(L,[D],Aux),
                          FNuevo is F-1,
                          modificar_matriz_aux(FNuevo,C,Lista,Dato,Aux,List).

%%Modificar Listado
modificar_lista(N,Lista,Dato,List):-
                          modificar_lista_aux(N,Lista,Dato,[],List),!.

modificar_lista_aux(N,Lista,Dato,L,List):-
                          length(Lista,X),
                          N>=X,
                          !.
                          
modificar_lista_aux(N,[D|Lista],Dato,L,List):-
                          N=:=0,
                          append(L,[Dato|Lista],List).
                          
modificar_lista_aux(N,[D|Lista],Dato,L,List):-
                          N=\=0,
                          length(Lista,X),
                          N=<X,
                          append(L,[D|[]],Aux),
                          NNuevo is N-1,
                          modificar_lista_aux(NNuevo,Lista,Dato,Aux,List).
                          
%%Calcula un array con las coordenadas de las bombas
posicionarBombas(NumBombas,NumFilas,NumColumnas,CoordenadasBombas):-
                          posicionesBombas_aux(NumBombas,NumFilas,NumColumnas,[],CoordenadasBombas).

posicionesBombas_aux(NumBombas,NumFilas,NumColumnas,CoordenadasBombas,Salida):-
                          NumBombas>0,
                          repeat,
                          random(0,NumFilas,Fila),
                          random(0,NumColumnas,Columna),
                          append([Fila],[Columna],Coor),
                          \+validar(Coor,CoordenadasBombas),
                          !,
                          Pos is NumBombas-1,
                          posicionesBombas_aux(Pos,NumFilas,NumColumnas,[Coor|CoordenadasBombas],Salida),
                          !.

posicionesBombas_aux(_,_,_,CoordenadasBombas,CoordenadasBombas).



validar(X,[X|_]).
validar(X,[_|Y]):-validar(X,Y).

%%Crea una copia de la lista y añade las bombas en las coordenadas indicadas
ponerBombas(Lista,[],Lista).
ponerBombas(Lista,[[F|C]|CoordenadasBombas],Salida):-
                          modificar_matriz(F,C,Lista,'B',List),
                          ponerBombas(List,CoordenadasBombas,Salida).

%%Obtener dato posicion
obtenerDato([],_,_,_,_,_).
obtenerDato(Lista,Fila,Columna,NumFilas,NumColumnas,Dato):-
                          Fila>=0,
                          Fila<NumFilas,
                          Columna>=0,
                          Columna<NumColumnas,
                          obtenerDato_aux(Lista,Fila,Columna,Dato).


obtenerDato_aux([V|Lista],0,Columna,Dato):-
                          obtenerDato_aux_dato(V,Columna,Dato).

obtenerDato_aux([V|Lista],Fila,Columna,Dato):-
                          N is Fila-1,
                          obtenerDato_aux(Lista,N,Columna,Dato).

obtenerDato_aux_dato([X|Lista],0,X).
                          
obtenerDato_aux_dato([X|Lista],Columna,Dato):-
                          NuevaCol is Columna-1,
                          obtenerDato_aux_dato(Lista,NuevaCol,Dato).
                          
%%Numero Bombas alrededor
bombasLados(List,Fila,Columna,NumFilas,NumColumnas, -2):-
                          obtenerDato(List,Fila,Columna,NumFilas,NumColumnas,Dato),
                          Dato ==  (' ').

bombasLados(List,Fila,Columna,NumFilas,NumColumnas, -1):-
                          obtenerDato(List,Fila,Columna,NumFilas,NumColumnas,Dato),
                          Dato ==  ('B').
bombasLados(List,Fila,Columna,NumFilas,NumColumnas,Num):-
                          bombasLados_aux(List,Fila-1,Columna,NumFilas,NumColumnas,X1),
                          bombasLados_aux(List,Fila,Columna-1,NumFilas,NumColumnas,X2),
                          bombasLados_aux(List,Fila+1,Columna,NumFilas,NumColumnas,X3),
                          bombasLados_aux(List,Fila,Columna+1,NumFilas,NumColumnas,X4),
                          bombasLados_aux(List,Fila-1,Columna-1,NumFilas,NumColumnas,X5),
                          bombasLados_aux(List,Fila-1,Columna+1,NumFilas,NumColumnas,X6),
                          bombasLados_aux(List,Fila+1,Columna-1,NumFilas,NumColumnas,X7),
                          bombasLados_aux(List,Fila+1,Columna+1,NumFilas,NumColumnas,X8),
                          Y is X1+X2,
                          Y1 is Y+X3,
                          Y2 is Y1+X4,
                          Y3 is Y2+X5,
                          Y4 is Y3+X6,
                          Y5 is Y4+X7,
                          Num is Y5+X8
                          ,!.

bombasLados(_,_,_,_,_,NumBombas).

bombasLados_aux(List,Fila,Columna,NumFilas,NumColumnas, 1):-
                          obtenerDato(List,Fila,Columna,NumFilas,NumColumnas,Dato),
                          Dato == ('B').

bombasLados_aux(List,Fila,Columna,NumFilas,NumColumnas, 0).


ganado(List,Res):-
            ganado_aux(List,0,RetRes), %Cuenta el numero de X que quedan
            RetRes==0,
            Res is 0,!.  %%Si no quedan X (Casillas por abrir), devuelve 0, termina el juego

ganado(List,Res):-
            ganado_aux(List,0,RetRes), %Cuenta el numero de X que quedan
            RetRes\=0,
            Res is 1,!. %%Si hay al menos 1 X devuelve un 1

ganado_aux([],Res,Res).

ganado_aux([L|List],Res,Ret):-
            ganado_aux_fila(L,Res,Ret1),
            ganado_aux(List,Ret1,Ret),!.


ganado_aux_fila([],Res,Res).

ganado_aux_fila([X|List],Res,Ret):-
            X=='B',
            ganado_aux_fila(List,Res,Ret).


ganado_aux_fila([X|List],Res,Ret):-
            X==' ',
            ganado_aux_fila(List,Res,Ret).

ganado_aux_fila([X|List],Res,Ret):-
            X=='x',
            Res1 is Res+1,
            ganado_aux_fila(List,Res1,Ret),!.