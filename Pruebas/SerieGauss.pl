% Autor:
% Fecha: 15/03/2016

suma(0,0):-!.

suma(N,R):- A is N-1, suma(A,Ra), R is N + Ra.
%suma(N�mero,Resultado):- Si A es N-1, suma(A, RA), Restulado = N�mero + RA