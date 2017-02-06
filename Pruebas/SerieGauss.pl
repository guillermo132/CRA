% Autor:
% Fecha: 15/03/2016

suma(0,0):-!.

suma(N,R):- A is N-1, suma(A,Ra), R is N + Ra.
%suma(Número,Resultado):- Si A es N-1, suma(A, RA), Restulado = Número + RA