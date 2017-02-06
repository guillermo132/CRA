% Autor: David Anoñanzas Saja y Mario García Salinero
% Fecha: 11/04/13

:- consult(diccionario).

% Reglas gramaticales
oracion(o(OS)) -->oracion_simple(OS).     %Oración simple
oracion(o(OC)) -->oracion_compuesta(OC).  %Oración compuesta

%Tipos de oraciones compuestas
oracion_subordinada(osub(NEXO,O)) --> nexo(NEXO),oracion_simple(O).
oracion_compuesta(oc(GN,OSUB,GV)) --> g_nominal(GN), oracion_subordinada(OSUB), g_verbal(GV).
oracion_compuesta(oc(GN,GV,OSUB)) --> g_nominal(GN), g_verbal(GV), oracion_subordinada(OSUB).
oracion_compuesta(oc(O1,C,O2)) --> oracion(O1),conjuncion(C),oracion(O2).

%Tipos de oraciones simples
oracion_simple(os(GN,GV)) --> g_nominal(GN), g_verbal(GV).
oracion_simple(os(GV)) --> g_verbal(GV).

%Tipos de grupos nominales compuestos
g_nominal(gn(GNOM1, CONJ, GNOM)) --> g_nom(GNOM1), conjuncion(CONJ), g_nom(GNOM).
g_nominal(gn(GNOM, GPREP)) --> g_nom(GNOM), g_preposicional(GPREP).
g_nominal(gn(GNOM, GADJ)) --> g_nom(GNOM), g_adjetival(GADJ).
g_nominal(gn(GNOM,NOMP)) --> g_nom(GNOM),nombrepropio(NOMP).
g_nominal(gn(GNOM)) --> g_nom(GNOM).

%Tipos de grupos nominales simples
g_nom(gnom(N,ADJ)) --> nombre(N), adjetivo(ADJ).
g_nom(gnom(DET,N,GA)) --> determinante(DET), nombre(N), g_adjetival(GA).
g_nom(gnom(DET,N)) --> determinante(DET), nombre(N).
g_nom(gnom(N)) --> nombre(N).
g_nom(gnom(NP)) --> nombrepropio(NP).

%Tipos de grupos adjetivales
g_adjetival(ga(ADJ, GPREP)) --> adjetivo(ADJ), g_preposicional(GPREP).
g_adjetival(ga(ADV,ADJ)) --> g_adverbial(ADV),adjetivo(ADJ).
g_adjetival(ga(ADJ1,ADJ)) --> adjetivo(ADJ1), adjetivo(ADJ).
g_adjetival(ga(ADJ, N)) --> adjetivo(ADJ), nombre(N).
g_adjetival(ga(ADJ)) --> adjetivo(ADJ).

%Tipos de grupos preposicionales
g_preposicional(gp(PREP,GN)) --> preposicion(PREP), g_nominal(GN).
g_preposicional(gp(PREP,GADV))--> preposicion(PREP), g_adverbial(GADV).
g_preposicional(gp(PREP,GA)) --> preposicion(PREP), g_adjetival(GA).
g_preposicional(gp(PREP,GV)) --> preposicion(PREP), g_verbal(GV).

%Tipos de grupos adverbiales
g_adverbial(gadv(ADV1,ADV)) --> adverbio(ADV1), adverbio(ADV).
g_adverbial(gadv(ADV,N)) --> adverbio(ADV),g_nominal(N).
g_adverbial(gadv(ADV, GP)) --> adverbio(ADV), g_preposicional(GP).
g_adverbial(gadv(ADV)) --> adverbio(ADV).

%Tipos de grupos vervales
g_verbal(gv(V,GN)) --> verbo(V), g_nominal(GN).
g_verbal(gv(V,ADJ)) --> verbo(V), g_adjetival(ADJ).
g_verbal(gv(V,ADV)) --> verbo(V), g_adverbial(ADV).
g_verbal(gv(V,PREP)) --> verbo(V), g_preposicional(PREP).
g_verbal(gv(V)) --> verbo(V).