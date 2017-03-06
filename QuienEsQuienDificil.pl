% Autores: Jesús Luque y Guillermo Gomez
% Fecha: 16/02/2017

listapersonajes([albert,paul,tom,derek,richard,louis,michael,charles,sam,steve,will,anthony,billy,henry,tiffany,natalie,roxanne,sarah,sabrina,cindy,emma]).

listachico([albert,paul,tom,derek,richard,louis,michael,charles,sam,steve,will,anthony,billy,henry]).
listachica([tiffany,natalie,roxanne,sarah,sabrina,cindy,emma]).
listaropa_roja([albert,paul,richard,louis,sam,steve,anthony,henry,natalie,sarah,cindy]).
listaropa_verde([tom,derek,michael,charles,will,billy,tiffany,roxanne,sabrina,emma]).
listagafas([albert,michael,charles,anthony,natalie,sabrina]).
listaojos_azules([albert,richard,louis,sam,will,billy,natalie,roxanne,sabrina]).
listaojos_marrones([paul,tom,derek,michael,charles,steve,anthony,henry,tiffany,sarah,cindy,emma]).
listapelo_negro([albert,tiffany,tom,derek,richard,louis,sarah,charles,sabrina,steve,cindy,henry]).
listapelo_rubio([paul,natalie,roxanne,michael,sam,will,anthony,billy,emma]).
listafeliz([albert,tiffany,tom,natalie,richard,roxanne,michael,charles,sabrina,steve,will,anthony,cindy,emma]).
listatriste([paul,derek,louis,sam,billy,henry,sarah]).

listapreguntas([chico,chica,ropa_roja,ropa_verde,gafas,ojos_azules,ojos_marrores,pelo_negro,pelo_rubio,triste,feliz]). %Lista de todas las preguntas.
listaPreguntasReducidas([chico,pelo_negro,ropa_roja,feliz,gafas,ojos_azules]). %Lista de las 6 preguntas básicas.

chico(X):-listachico(Y),member(X,Y).  %Predicado que indica si la variable X es un chico.
chica(X):-listachico(Y), \+member(X,Y).  %Predicado que indica si la variable X es una chica.
pelo_negro(X):-listapelo_negro(Y), member(X,Y). %Predicado que indica si la variable X tiene pelo negro.
pelo_rubio(X):-listapelo_rubio(Y), member(X,Y). %Predicado que indica si la variable X tiene pelo rubio.
ropa_roja(X):-listaropa_roja(Y), member(X,Y). %Predicado que indica si la variable X tiene ropa roja.
ropa_verde(X):-listaropa_verde(Y), member(X,Y). %Predicado que indica si la variable X tiene ropa verde.
feliz(X):-listafeliz(Y), member(X,Y). %Predicado que indica si la variable X está feliz.
triste(X):-listatriste(Y), member(X,Y). %Predicado que indica si la variable X está triste.
gafas(X):-listagafas(Y),member(X,Y). %Predicado que indica si la variable X tiene gafas.
no_gafas(X):-listagafas(Y),\+member(X,Y). %Predicado que indica si la variable X no tiene gafas.
ojos_azules(X):-listaojos_azules(Y), member(X,Y). %Predicado que indica si la variable X tiene los ojos azules.
ojos_marrones(X):-listaojos_marrones(Y), member(X,Y). %Predicado que indica si la variable X tiene los ojos marrones.


%Funciones de escritura
escribirFichaJug(FichaUser):-write('Tu personaje es: '), write(FichaUser) , write('\n').
escribirFicha(FichaPC):-write('PC personaje es: '), write(FichaPC).
escribirVictoriaPC(FichaUser):- write('\nPC GANA, OTRA VEZ SERA').
escribirVictoriaJugador(FichaPC):- write('\nENHORABUNA, HAS GNADO AL PC').
escribirListaPersonajes(ListaUser):- write('\nLista de personajes: '), write(ListaUser).
escribirListaPreguntas(ListaPreguntasReducidas):- write('\nLista de preguntas: '), write(ListaPreguntasReducidas).
escribeLongitud(ListaAux):-length(ListaAux,Numero),write(Numero).

%Funciones que eliminan elementos de listas

%Introduce personaje en la lista de elemtos que son Preg (=personaje)
eliminarPersonajesAux(FichaPC,[H|Q],Z,ListaAux,L):- Z=..[Preg,FichaPC],call(Z), A=..[Preg,H], call(A),eliminarPersonajesAux(FichaPC,Q,Z,ListaAux,[H|L]).  %Z=..[Pregunta,FichaComp],
%Introduce personajes en la lista de elemntos que cumplen de forma negativa Preg (=personaje)
eliminarPersonajesAux(FichaPC,[H|Q],Z,ListaAux,L):- Z=..[Preg,FichaPC],\+call(Z), A=..[Preg,H], \+call(A),eliminarPersonajesAux(FichaPC,Q,Z,ListaAux,[H|L]).
%En caso de que no se cumplan niguna de las dos opciones anteriores no se guarda el elemnto en L (!=persnaje)
eliminarPersonajesAux(FichaPC,[_|Q],Z,ListaAux,L):-eliminarPersonajesAux(FichaPC,Q,Z,ListaAux,L).
%Finaliza la recursividad mostrando la lista de personajes actualizada.
eliminarPersonajesAux(_,[],_,ListaAux,L):- append([],L,ListaAux).
eliminarPersonajes(FichaPC,ListaUser,Z,ListaAux):- eliminarPersonajesAux(FichaPC,ListaUser,Z,ListaAux,[]).


% Selecciona la pregunta más optima de las que le queden

%Se le da la vuelta a la listaAux para tenerla al derecho y que Posicion coincida con el elemento que buscamos
seleccionarPreguntaAux(_,_,[],ListaMenorDiferencia,L):-append([],L,ListaAux),reverse(ListaAux,ListaMenorDiferencia).
%Busca posicion de la pregunta que tiene menor diferencia entre el una pregunta y su negado
seleccionarPreguntaAux(FichaUser,ListaPC,[H|Q],ListaMenorDiferencia,L):-length(ListaPC,NumTotal), Z=..[H,FichaUser], eliminarPersonajes(FichaUser,ListaPC,Z,ListaNueva)
  ,length(ListaNueva,NumElem),NumOpuestos is NumTotal-NumElem, Diferencia is NumOpuestos-NumElem/*, write('\n numero elementos '),write(NumElem), write('\n diferencia '),write(Diferencia)*/
  ,Absoluto is abs(Diferencia), seleccionarPreguntaAux(FichaUser,ListaPC,Q,ListaMenorDiferencia,[Absoluto|L]).
%Introducimos en Preg la pregunta seleccionada que es la que tiene una menor diferencia entre una pregunta y su negado
seleccionarPreguntaMDAux(FichaUser,ListaPC,ListaPreguntasReducidas,Preg):-seleccionarPreguntaAux(FichaUser,ListaPC,ListaPreguntasReducidas,ListaMenorDiferencia,[])
  ,min_list(ListaMenorDiferencia,Minimo),nth1(Posicion,ListaMenorDiferencia,Minimo),nth1(Posicion,ListaPreguntasReducidas,Preg).
%Predicado del la primera funcion para elegir pregunta
seleccionarPregunta(FichaUser,ListaPC,ListaPreguntasReducidas,ListaPreguntasReducidasNueva,ListaAuxPC):-seleccionarPreguntaMDAux(FichaUser,ListaPC,ListaPreguntasReducidas,Preg)
  ,write('\nPregunta: '),write(Preg),select(Preg,ListaPreguntasReducidas,ListaPreguntasReducidasNueva),Z=..[Preg,FichaUser],eliminarPersonajes(FichaUser,ListaPC,Z,ListaAuxPC).

%Emulacion del turno del PC
%elegir pregunta, restar personajes, poner cuantos elementos le quedan
jugadaPC(FichaUser,ListaPC,ListaUser,FichaUser,ListaPreguntasReducidas,ListaAuxPC):- write('\nTurno del PC: '),seleccionarPregunta(FichaUser,ListaPC,ListaPreguntasReducidas,ListaPreguntasReducidasNueva,ListaAuxPC)
 ,write('. Me queda una lista de '),escribeLongitud(ListaAuxPC),write(' personajes '),write(ListaAuxPC).

       
%Preguntas que hace el jugador
bucleEjecucion(FichaPC,_,[_],_,_):- escribirVictoriaJugador(FichaPC). %Finaliza la partida y gana el jugador
bucleEjecucion(FichaUser,_,_,[_],_):- escribirVictoriaPC(FichaUser). %Finaliza la partida y gana el pc
bucleEjecucion(FichaUser,FichaPC,ListaUser,ListaPC,ListaPreguntasReducidas):- write('\n\nTurno del Usuario: '),escribirListaPersonajes(ListaUser),escribirListaPreguntas(ListaPreguntasReducidas),
write('\n'),read(Preg), Z=..[Preg,FichaPC], eliminarPersonajes(FichaPC,ListaUser,Z,ListaAuxUser),jugadaPC(FichaUser,ListaPC,ListaUser,FichaUser,ListaPreguntasReducidas,ListaAuxPC),
bucleEjecucion(FichaUser,FichaPC,ListaAuxUser,ListaAuxPC,ListaPreguntasReducidas).


% Comienza la partida y genera el personaje para cada uno de los jugadores y se las asigna.
comenzarMD:-random(1,21,Aleatorio), listapersonajes(Todos),nth1(Aleatorio,Todos,FichaUser),select(FichaUser,Todos,ListaUser),escribirFichaJug(FichaUser),
random(1,20,Aleat),nth1(Aleat,User,FichaPC),select(FichaPC,Todos,ListaPC), listaPreguntasReducidas(ListaPreguntasReducidas),escribirFicha(FichaPC),
bucleEjecucion(FichaUser,FichaPC,ListaUser,ListaPC,ListaPreguntasReducidas).



