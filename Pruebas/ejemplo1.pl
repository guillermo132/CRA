% Autor:
% Fecha: 06/02/2013

%HECHOS
mujer(maria).
mujer(sara).
mujer(pepa).

hombre(carlos).
hombre(pedro).
hombre(juan).

padre(juan,pedro).		%juan es el padre de pedro
padre(juan,sara).
padre(carlos,pepa).

madre(maria,pedro).
madre(maria,sara).
madre(maria,carlos).
%madre(pepa,felipe_2).

%q(-12.31456).

%REGLAS
hermanos(X,Y) :- padre(Z,X),padre(Z,Y).
hermanos(X,Y) :- madre(Z,Y),madre(Z,Y).
 