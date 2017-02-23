% Autor:
% Fecha: 15/03/2016

listar(L):- L = [1,2,3,4,5].
listar2(L):- Cabeza = 1, Cola = [2,3,4,5], L = [Cabeza|Cola].

cabeza([Ca|Co],Ca).
cola([Cab|Col],Col).

sin2cabezas([_,_|C],C).

%Sin Usar listas:

  %progenitor(pedro,ana).
  %progenitor(pedro,ramon).
  %progenitor(ana,ramon).

  %primerHijo(P,Hijo):- progenitor(P,Hijo), !.

%Usando listas

  %progenitor(pedro, [ana,ramon]).
  %progenitor(ana, [ramon,pepe,juan]).
  %primerHijo(P,Hijo):- progenitor(P,[Hijo|_]).

%Buscando en una lista

progenitor(pedro, [ana,ramon,pedro,javier,josh,vilma,nicolas]).
progenitor(juan, [ben,pepe,josue,jesica,pavel,keith,kyle]).

padreDe(P,H):- progenitor(P,Hijos), buscar(H, Hijos).
buscar(H, [   ]):- !, fail.
buscar(H, [H|L]):- !, true.
buscar(H, [C|L]):- buscar(H,L).
