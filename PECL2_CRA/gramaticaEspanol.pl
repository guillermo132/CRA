
%====================================================
%::::::::::::::REGLAS PARA LA GRAMATICA::::::::::::::
%====================================================


%ORACIONES

oracion(o(GN,GV,GN2)) --> g_nominal(GN,_,Num),g_verbal(GV,_,Num),g_nominal(GN2,_,Num). %1,2,3,4,5,7,10
oracion(o(GN,GV,GC)) --> g_nominal(GN,_,Num),g_verbal(GV,_,Num),g_circustancial(GC,_,_). %6
oracion(o(GN,GV,GN2,GC)) --> g_nominal(GN,_,Num),g_verbal(GV,_,Num),g_nominal(GN2,_,Num),g_circustancial(GC,_,_). %8
oracion(o(GN,GV)) --> g_nominal(GN,_,Num),g_verbal(GV,_,Num). %9
oracion(o(GV,GN))-->g_verbal(GV,_,Num),g_nominal(GN,_,Num).
oracion(o(GN,PR,O1,GV,GN2)) --> g_nominal(GN,_,Num),pronombres(PR),oracion(O1),g_verbal(GV,_,Num),g_nominal(GN2,_,_). %10
oracion(o(O1,C,O2)) --> oracion(O1),conjunciones(C),oracion(O2). %13


%Grupo g_nominal

g_nominal(gn(A,N),G,Num) --> articulo(A,G,Num),nombre(N,G,Num).%1,5,7,10
g_nominal(gn(NP,NP2),_,Num) --> nom_p(NP,Num),nom_p(NP2,Num). %14
g_nominal(gn(NP),_,Num) --> nom_p(NP,Num).        %2,4
g_nominal(gn(A,N,AD),G,Num) --> articulo(A,G,Num),nombre(N,G,Num),adjetivos(AD,_). %3
g_nominal(gn(A,AD,N),G,Num) --> articulo(A,G,Num),nombre(N,G,Num),adjetivos(AD,_). %3
g_nominal(gn(PR,N),G,Num) --> pronombres(PR),nombre(N,G,Num). %10
g_nominal(gn(A,N,P,NP),G,Num) --> articulo(A,G,Num),nombre(N,G,Num),preposiciones(P,G),nom_p(NP,Num). %14
g_nominal(gn(A,NP,P,N),G,Num) --> articulo(A,G,Num),nombre(N,G,Num),preposiciones(P,G),nom_p(NP,Num).


%Grupo Verbal

g_verbal(gv(V),_,Num) --> verbo(V,Num). %1,2,3,4,5,7
g_verbal(gv(V,AD),G,Num) -->verbo(V,Num),adjetivos(AD,G). %


%Grupo Circustancial

g_circustancial(gc(P,A,N),G,Num) --> preposiciones(P,G), articulo(A,G,Num),nombre(N,G,Num).%6
g_circustancial(gc(ADV,ADV2),_,_) --> adverbio(ADV),adverbio(ADV2). %11
g_circustancial(gc(ADV),_,_) --> adverbio(ADV).

