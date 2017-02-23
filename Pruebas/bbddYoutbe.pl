% Autor:
% Fecha: 15/03/2016

%materiales
mat(cemento, 20).
mat(arena, 5).
mat(cal, 10).

%Herramientas y maquinas
equipo(grua,200).
equipo(taladro,50).

proyectarN(X):- mat(X,_).