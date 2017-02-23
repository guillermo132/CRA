% Autor: David Anoñanzas Saja y Mario García Salinero
% Fecha: 11/04/13

%Importar sintaxis y draw
:-consult(sintaxis),consult(draw).

%iniciar las consultas de pruebas
inicio:- p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16,p17,p18,p19,p20,p21,p22,p23,p24,p25,p26,p27,p28,p29,p30.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Simples%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p1 :- oracion(X,[el,hombre,grande,come,la,manzana,roja],[]),draw(X).
p2 :- oracion(X,[el,hombre,con,un,tenedor,grande,come,la,manzana,roja],[]),draw(X).
p3 :- oracion(X,[juan,y,maría,comen,la,manzana,roja,con,un,tenedor,y,un,cuchillo],[]),draw(X).
p4 :- oracion(X,[maría,hace,la,práctica,de,juan],[]),draw(X).
p5 :- oracion(X,[el,canario,de,juan,y,maría,canta],[]),draw(X).
p6 :- oracion(X,[el,perro,persiguió,un,gato,en,el,jardín],[]),draw(X).
p7 :- oracion(X,[juan,es,grande],[]),draw(X).
p8 :- oracion(X,[la,capital,madrid,es,hermosa],[]),draw(X).
p9 :- oracion(X,[está,muy,lejos],[]),draw(X).
p10 :- oracion(X,[es,lento,de,reflejos],[]),draw(X).
p11 :- oracion(X,[está,lejos,de,madrid],[]),draw(X).
p12 :- oracion(X,[juan,habla,muy,claramente],[]),draw(X).
p13 :- oracion(X,[la,esperanza,de,vida,de,un,niño,depende,de,su,lugar,de,nacimiento],[]),draw(X).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%Compuestas%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

p14 :- oracion(X,[el,hombre,que,vimos,ayer,era,mi,vecino],[]),draw(X).
p15 :- oracion(X,[el,hombre,que,vimos,en,la,universidad,era,mi,profesor],[]),draw(X).
p16 :- oracion(X,[juan,que,es,muy,ágil,escala,en,el,rocodromo,por,las,tardes],[]),draw(X).
p17 :- oracion(X,[juan,que,es,muy,delicado,come,solamente,manzanas,rojas],[]),draw(X).
p18 :- oracion(X,[el,ratón,que,cazó,el,gato,era,gris],[]),draw(X).
p19 :- oracion(X,[el,procesador,de,textos,que,es,una,herramienta,muy,potente,sirve,para,escribir,documentos],[]),draw(X).
p20 :- oracion(X,[el,procesador,de,textos,es,una,herramienta,muy,potente,que,sirve,para,escribir,documentos],[]),draw(X).
p21 :- oracion(X,[juan,es,moreno,y,maría,es,alta],[]),draw(X).
p22 :- oracion(X,[juan,estudia,filosofía,pero,maría,estudia,derecho],[]),draw(X).
p23 :- oracion(X,[maría,toma,un,café,mientras,juan,recoge,la,mesa],[]),draw(X).
p24 :- oracion(X,[juan,toma,café,y,lee,el,periódico],[]),draw(X).
p25 :- oracion(X,[juan,y,héctor,comen,patatas,fritas,y,beben,cerveza],[]),draw(X).
p26 :- oracion(X,[juan,come,patatas,fritas,pero,maría,prefiere,paella,aunque,héctor,toma,café,e,irene,lee,una,novela],[]),draw(X).
p27 :- oracion(X,[irene,canta,y,salta,mientras,juan,estudia],[]),draw(X).
p28 :- oracion(X,[héctor,come,patatas,fritas,y,bebe,zumo,mientras,juan,canta,y,salta,aunque,maría,lee,una,novela],[]),draw(X).
p29 :- oracion(X,[irene,canta,y,salta,y,sonríe,alegre],[]),draw(X).
p30 :- oracion(X,[el,procesador,de,textos,es,una,herramienta,muy,potente,que,sirve,para,escribir,documentos,pero,es,bastante,lento],[]),draw(X).
