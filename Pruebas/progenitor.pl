% Autor:
% Fecha: 15/03/2016

es_par(X):- 0 is X mod 2.

progenitor(clara,pedro).
progenitor(pedro,jose).
progenitor(ana,clara).
progenitor(jose,clara).

abuelo(X,Y):- progenitor(X,Z), progenitor(Z,Y).
bisabuelo(X,Y):- progenitor(X,Z), abuelo(Z,Y).