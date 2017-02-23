% Autor:
% Fecha: 06/02/2013

hijo(pedro,pablo).		%pablo es hijo de pedro
hijo(pablo,josé).
hijo(jose,javier).
hijo(javier,hector).

descendiente(X,Y):- hijo(X,Y).
descendiente(X,Y):- hijo(X,Z),descendiente(Z,Y).