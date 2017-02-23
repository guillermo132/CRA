%***********************************************************
%**************** ORACIONES PARA ANALIZAR ******************
%***********************************************************



:-consult('c:/Users/Francisco/Desktop/Practica _2/gramatica.pl').
:-consult('c:/Users/Francisco/Desktop/Practica _2/diccionario.pl').
:-consult('c:/Users/Francisco/Desktop/Practica _2/draw.pl').

%************************* PRUEBAS *************************
prueba1:- oracion(X,[el,hombre,come,una,manzana],[]),draw(X),write(X).
prueba2:- oracion(X,[la,mujer,come,manzanas],[]),draw(X),write(X).
prueba3:- oracion(X,[mar�a,come,una,manzana,roja],[]),draw(X),write(X).
prueba4:- oracion(X,[juan,ama,a,mar�a],[]),draw(X),write(X).
prueba5:- oracion(X,[el,gato,grande,come,un,rat�n,gris],[]),draw(X),write(X).
prueba6:- oracion(X,[juan,estudia,en,la,universidad],[]),draw(X),write(X).
prueba7:- oracion(X,[el,alumno,ama,la,universidad],[]),draw(X),write(X).
prueba8:- oracion(X,[el,gato,come,ratones],[]),draw(X),write(X).
prueba9:- oracion(X,[la,manzana,come,un,gato],[]),draw(X),write(X).
prueba10:- oracion(X,[la,universidad,es,grande],[]),draw(X),write(X).
prueba11:- o_relativo(X,[que,es,una,herramienta,muy,potente],[]),draw(X),write(X).

nota:-write('ocm = Oraci�n compuesta,  or = Oraci�n subordinada de relativo  oc = Oraci�n coordinada').
salto:-nl,nl.
%************************* TEST *****************************
test1:- oracion(X,[el,hombre,grande,come,la,manzana],[]),draw(X),write(X).
test2:- oracion(X,[el,hombre,con,un,tenedor,grande,come,la,manzana,roja],[]),draw(X),write(X).
test3:- oracion(X,[juan,y,mar�a,comen,la,manzana,roja,con,un,tenedor,y,un,cuchillo],[]),draw(X),write(X).
test4:- oracion(X,[mar�a,hace,la,pr�ctica,de,juan],[]),draw(X),write(X).
test5:- oracion(X,[el,canario,de,juan,y,mar�a,canta],[]),draw(X),write(X).
test6:- oracion(X,[el,perro,persigui�,un,gato,en,el,jard�n],[]),draw(X),write(X).
test7:- oracion(X,[juan,es,grande],[]),draw(X),write(X).
test8:- oracion(X,[la,capital,madrid,es,hermosa],[]),draw(X),write(X).
test9:- oracion(X,[est�,muy,lejos],[]),draw(X),write(X).
test10:- oracion(X,[es,lento,de,reflejos],[]),draw(X),write(X).
test11:- oracion(X,[est�,lejos,de,madrid],[]),draw(X),write(X).
test12:- oracion(X,[juan,habla,muy,claramente],[]),draw(X),write(X).
test13:- oracion(X,[la,esperanza,de,vida,de,un,ni�o,depende,de,su,lugar,de,nacimiento],[]),draw(X),write(X).
test14:- o_compuesta(X,[el,hombre,que,vimos,ayer,era,mi,vecino],[]),draw(X),write(X),salto,nota.
test15:- o_compuesta(X,[el,hombre,que,vimos,en,la,universidad,era,mi,profesor],[]),draw(X),write(X),salto,nota.
test16:- o_compuesta(X,[juan,que,es,muy,�gil,escala,en,el,roc�dromo,por,las,tardes],[]),draw(X),write(X),salto,nota.
test17:- o_compuesta(X,[juan,que,es,muy,delicado,come,solamente,manzanas,rojas],[]),draw(X),write(X),salto,nota.
test18:- o_compuesta(X,[el,rat�n,que,caz�,el,gato,era,gris],[]),draw(X),write(X),salto,nota.
test19:- o_compuesta(X,[el,procesador,de,textos,que,es,una,herramienta,muy,potente,sirve,para,escribir,documentos],[]),draw(X),write(X),salto,nota.
test20:- o_compuesta(X,[el,procesador,de,textos,es,una,herramienta,muy,potente,que,sirve,para,escribir,documentos],[]),draw(X),write(X),salto,nota.
test21:- o_coordinada(X,[juan,es,moreno,y,mar�a,es,alta],[]),draw(X),write(X),salto,nota.
test22:- o_coordinada(X,[juan,estudia,filosof�a,pero,mar�a,estudia,derecho],[]),draw(X),write(X),salto,nota.
test23:- o_coordinada(X,[mar�a,toma,caf�,mientras,juan,recoge,la,mesa],[]),draw(X),write(X),salto,nota.
test24:- o_coordinada(X,[mar�a,toma,un,caf�,y,lee,el,peri�dico],[]),draw(X),write(X),salto,nota.
test25:- o_coordinada(X,[juan,y,h�ctor,comen,patatas,fritas,y,beben,cerveza],[]),draw(X),write(X),salto,nota.
test26:- o_compuesta(X,[juan,come,patatas,fritas,pero,mar�a,prefiere,paella,aunque,h�ctor,toma,caf�,e,irene,lee,una,novela],[]),draw(X),write(X),salto,nota.
test27:- o_compuesta(X,[irene,canta,y,salta,mientras,juan,estudia],[]),draw(X),write(X),salto,nota.
test28:- o_compuesta(X,[h�ctor,come,patatas,fritas,y,bebe,zumo,mientras,juan,canta,y,salta,aunque,mar�a,lee,una,novela],[]),draw(X),write(X),salto,nota.
test29:- o_compuesta(X,[irene,canta,y,salta,y,sonr�e,alegre],[]),draw(X),write(X),salto,nota.
test30:- o_compuesta(X,[el,procesador,de,textos,es,una,herramienta,muy,potente,que,sirve,para,escribir,documentos,pero,es,bastante,lento],[]),draw(X),write(X),salto,nota.

