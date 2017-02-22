% Autor:
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

listapreguntas([chico,chica,ropa_roja,ropa_verde,gafas,ojos_azules,ojos_marrores,pelo_negro,pelo_rubio,triste,feliz]).
listaPreguntasReducidas([chico,pelo_negro,ropa_roja,feliz,gafas,ojos_azules]). %Lista de las 6 preguntas básicas.
busqueda(pregunta,lista):-

chico(X):-listachico(Y),member(X,Y).  %Predicado que indica si la variable X es un chico.
chica(X):-listachico(Y), \+member(X,Y).  %Predicado que indica si la variable X es una chica.
pelo_negro(X):-listapelo_negro(Y), member(X,Y). %Predicado que indica si la variable X tiene pelo negro.
pelo_rubio(X):-listapelo_negro(Y),\+member(X,Y). %Predicado que indica si la variable X tiene pelo rubio.
ropa_roja(X):-listaropa_roja(Y), member(X,Y). %Predicado que indica si la variable X tiene ropa roja.
ropa_verde(X):-listaropa_roja(Y),\+member(X,Y). %Predicado que indica si la variable X tiene ropa verde.
feliz(X):-listafeliz(Y),member(X,Y). %Predicado que indica si la variable X está feliz.
triste(X):-listafeliz(Y),\+member(X,Y). %Predicado que indica si la variable X está triste.
gafas(X):-listagafas(Y),member(X,Y). %Predicado que indica si la variable X tiene gafas.
no_gafas(X):-listagafas(Y),\+member(X,Y). %Predicado que indica si la variable X no tiene gafas.
ojos_azules(X):-listaojos_azules(Y),member(X,Y). %Predicado que indica si la variable X tiene los ojos azules.
ojos_marrones(X):-listaojos_azules(Y),\+member(X,Y). %Predicado que indica si la variable X tiene los ojos marrones.

escribirFichaJug(FichaUser):-write('Su personaje es: '), write(FichaUser) , write('\n').

% Genera el personaje para cada uno de los jugadores y se las asigna. Además inicia la partida.
comenzarMF:-random(1,21,Aleatorio), listapersonajes(Todos),nth1(Aleatorio,Todos,FichaUser),select(FichaJug,Todos,ListaUser),escribirFichaJug(FichaUser),
random(1,20,Aleat),nth1(Aleat,ListaJug,FichaPC),select(FichaComp,Todos,ListaPC), listaPreguntasReducidas(ListaPreguntasReducidas).
%jugandoUsuarioMF(ListaComp,FichaComp,ListaJug,FichaJug,ListaPreguntasReducidas).


%personajes()
%PersonajePC:-
%PersonajePlayer :-

%estrategia basica
%   Selecion aleatoria del personaje del jugador RANDOM (para jugador)
%   segun k personajje es listar las caracteristicas  (para jugador)
%   Seleccion aleatirua del personaje (para makina)
% |-Sacar por pantalla pregunta al jugador (WRITE)
% | Leer pregunta (READ) y metemos a vvariable
% | analisis de la respuesta y Mostrar personajes k cumplen las caracteristicas
% | maquina hace pregunta
% |-analisis de su pregunta y cuenta los posibles personajes (ELIMINAR CANDIDATOS)