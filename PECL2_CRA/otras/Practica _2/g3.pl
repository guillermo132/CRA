%***********************************************************
%**************REGLAS GRAMATICALES**************************
%***********************************************************

% Oración Simple
  oracion(o(GV))--> g_verbal(GV).
  oracion(o(GN,GV))--> g_nominal(GN),g_verbal(GV).
  
%Oracion subordinada de relativo
  o_relativo(or(Pron,GV))--> pronombre(Pron),g_verbal(GV).
  %o_relativo(or(Pron,V,S))--> pronombre(Pron),verbo(V),sub(S).
  
%Oracion Compuesta
  o_compuesta(oc(GN,GV))-->g_nominal(GN),g_verbal(GV).

% Grupo nominal
  g_nominal(gn(Nom)) -->nombre(Nom).
  g_nominal(gn(Np)) -->nombre_propio(Np).
  g_nominal(gn(Det,Nom))-->determinante(Det),nombre(Nom).
  g_nominal(gn(Det,Nom,Np))-->determinante(Det),nombre(Nom),nombre_propio(Np).
  g_nominal(gn(Nom,GAdj))-->nombre(Nom),g_adjetival(GAdj).
  g_nominal(gn(Np,GAdj))-->nombre_propio(Np),g_adjetival(GAdj).
  g_nominal(gn(Det,Nom,GAdj))-->determinante(Det),nombre(Nom),g_adjetival(GAdj).
  g_nominal(gn(Np,Conj,Np1))-->nombre_propio(Np),conjuncion(Conj),nombre_propio(Np1).
  g_nominal(gn(Det,Nom,Conj,Det1,Nom1))-->determinante(Det),nombre(Nom),conjuncion(Conj),determinante(Det1),nombre(Nom1).
  g_nominal(gn(GN,GPrep))-->g_nominal(GN),g_preposicional(GPrep).

 sub(sub(Prep,GV))-->preposicion(Prep),g_verbal(GV).

% Grupo verbal
  g_verbal(gv(V))--> verbo(V).
  g_verbal(gv(V,Adv))-->verbo(V),adverbio(Adv).
  g_verbal(gv(V,GAdj))--> verbo(V),g_adjetival(GAdj).
  g_verbal(gv(V,GAdv))--> verbo(V),g_adverbial(GAdv).
  g_verbal(gv(V,GPrep))--> verbo(V),g_preposicional(GPrep).
  g_verbal(gv(V,GN))--> verbo(V),g_nominal(GN).
  g_verbal(gv(OR,V,GN))-->o_relativo(OR),verbo(V),g_nominal(GN).
  g_verbal(gv(OR,V,GPrep))-->o_relativo(OR),verbo(V),g_preposicional(GPrep).
  g_verbal(gv(OR,S))-->o_relativo(OR),sub(S).

% Grupo Adjetival
  g_adjetival(gAdj(Adj))--> adjetivo(Adj).
  g_adjetival(gAdj(Adv,Adj))--> adverbio(Adv),adjetivo(Adj).
  g_adjetival(gAdj(Adj,GPrep))-->adjetivo(Adj),g_preposicional(GPrep).

% Grupo Preposicional

  g_preposicional(gPrep(Prep,GAdj))--> preposicion(Prep),g_adjetival(GAdj).
  g_preposicional(gPrep(Prep,GAdv))--> preposicion(Prep),g_adverbial(GAdv).
  g_preposicional(gPrep(Prep,GN))--> preposicion(Prep),g_nominal(GN).
  %g_preposicional(gPrep(GPrep,GPrep1))--> g_preposicional(GPrep),g_preposicional(GPrep1).


% Grupo Adverbial
  g_adverbial(gAdv(AdvModif,Adv))-->adverbio(AdvModif),adverbio(Adv).
  g_adverbial(gAdv(Adv,GPrep))-->adverbio(Adv),g_preposicional(GPrep).
  g_adverbial(gAdv(AdvModif,Adv,GPrep))-->adverbio(AdvModif),adverbio(Adv),g_preposicional(GPrep).

%Determiante
  determinante(det(Det)) -->[Det],{det(Det)}.
  
%Nombre
  nombre(n(Nom)) -->[Nom],{n(Nom)}.

%Nombre Propio
  nombre_propio(np(Np)) -->[Np],{np(Np)}.
  
%Verbo
  verbo(v(V)) -->[V],{v(V)}.
  
%Adjetivo
  adjetivo(adj(Adj)) -->[Adj],{adj(Adj)}.
  
%Preposición
  preposicion(prep(Prep))-->[Prep],{prep(Prep)}.
  
%Adverbio
  adverbio(adv(Adv))-->[Adv],{adv(Adv)}.
  
%Pronombre
  pronombre(pron(Pron))-->[Pron],{pron(Pron)}.
  
%Conjunción
  conjuncion(conj(Conj))-->[Conj],{conj(Conj)}.
  
  
