:-consult('C:/Users/david/Desktop/diccionarioIngles').
:-consult('C:/Users/david/Desktop/gramaticaIngles').
:-consult('C:/Users/david/Desktop/diccionarioEspanol').
:-consult('C:/Users/david/Desktop/gramaticaEspanol').

%:-consult('/Users/rafaellujan/Desktop/TRADUCIR/diccionarioIngles').
%:-consult('/Users/rafaellujan/Desktop/TRADUCIR/gramaticaIngles').
%:-consult('/Users/rafaellujan/Desktop/TRADUCIR/diccionarioEspanol').
%:-consult('/Users/rafaellujan/Desktop/TRADUCIR/gramaticaEspanol').

%===============================================================
%                                       ORACIONES PARA ANALIZAR
%===============================================================

%VER QUE ANALIZA BIEN ESPAÑOL
prueba1:- oracion(X,[el,hombre,come,una,manzana],[]),write(X).
prueba2:- oracion(X,[ellos,comen,manzanas],[]),write(X).
prueba3:- oracion(X,[tu,comes,una,manzana,roja],[]),write(X).
prueba4:- oracion(X,[juan,ama,maria],[]),write(X).
prueba5:- oracion(X,[el,gato,grande,come,un,raton,gris],[]),write(X).
prueba6:- oracion(X,[juan,estudia,en,la,universidad],[]),write(X).
prueba7:- oracion(X,[el,alumno,ama,la,universidad],[]),write(X).
prueba8:- oracion(X,[el,perro,persiguio,un,gato,negro,en,el,jardin],[]),write(X).
prueba9:- oracion(X,[la,universidad,es,grande],[]),write(X).
prueba10:- oracion(X,[el,hombre,que,nosotros,vimos,ayer,es,mi,vecino],[]),write(X).
prueba11:- oracion(X,[el,canario,amarillo,canta,muy,bien],[]),write(X).
prueba12:- oracion(X,[juan,toma,un,cafe,y,lee,el,periodico],[]),write(X).
prueba13:- oracion(X,[juan,es,delgado,y,maria,es,alta],[]),write(X).
prueba14:- oracion(X,[oscar,wilde,escribio,el,fantasma,de,canterville],[]),write(X).

%VER QUE ANALIZA BIEN INGLES
iprueba1:- sentence(X,[the,man,eats,an,apple],[]),write(X).%okey
iprueba2:- sentence(X,[they,eat,some,apples],[]),write(X).%okey
iprueba3:- sentence(X,[you,eat,a,red,apple],[]),write(X).%okey
iprueba4:- sentence(X,[john,loves,mary],[]),write(X).%okey
iprueba5:- sentence(X,[the,big,cat,eats,a,grey,mouse],[]),write(X).%okey
iprueba6:- sentence(X,[john,studies,at,the,university],[]),write(X).%okey
iprueba7:- sentence(X,[the,student,loves,the,university],[]),write(X).%okey
iprueba8:- sentence(X,[the,dog,chased,a,black,cat,in,the,garden],[]),write(X).%okey
iprueba9:- sentence(X,[the,university,is,large],[]),write(X).%okey
iprueba10:- sentence(X,[the,man,that,we,saw,yesterday,is,my,neighbour],[]),write(X).%okey
iprueba11:- sentence(X,[the,yellow,canary,sings,very,well],[]),write(X).%falla
iprueba12:- sentence(X,[john,has,a,coffee,and,reads,the,newspaper],[]),write(X).%okey
iprueba13:- sentence(X,[john,is,thin,and,mary,is,tall],[]),write(X).%okey
iprueba14:- sentence(X,[oscar,wilde,wrote,the,canterville,ghost],[]),write(X).%okey


%TRADUCIR DE ESPAÑOL A INGLES
test1:-oracion(X,[el,hombre,come,una,manzana],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).
test2:-oracion(X,[ellos,comen,manzanas],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).
test3:-oracion(X,[tu,comes,una,manzana,roja],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).
test4:-oracion(X,[juan,ama,maria],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).
test5:-oracion(X,[el,gato,grande,come,un,raton,gris],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).
test6:-oracion(X,[juan,estudia,en,la,universidad],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).
test7:-oracion(X,[el,alumno,ama,la,universidad],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).
test8:-oracion(X,[el,perro,persiguio,un,gato,negro,en,el,jardin],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).
test9:-oracion(X,[la,universidad,es,grande],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).
test10:-oracion(X,[el,hombre,que,nosotros,vimos,ayer,es,mi,vecino],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).
test11:-oracion(X,[el,canario,amarillo,canta,muy,bien],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).
test12:-oracion(X,[juan,toma,un,cafe,y,lee,el,periodico],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).
test13:-oracion(X,[juan,es,delgado,y,maria,es,alta],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).
test14:-oracion(X,[oscar,wilde,escribio,el,fantasma,de,canterville],[]),sentence(X,Ingles,[]),write('Inglés: '),write(Ingles).


%TRADUCIR DE INGLES A ESPAÑOL
testi1:-sentence(X,[the,man,eats,an,apple],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).
testi2:-sentence(X,[they,eat,some,apples],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).
testi3:-sentence(X,[you,eat,a,red,apple],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).
testi4:-sentence(X,[john,loves,mary],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).
testi5:-sentence(X,[the,big,cat,eats,a,grey,mouse],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).
testi6:-sentence(X,[john,studies,at,the,university],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).
testi7:-sentence(X,[the,student,loves,the,university],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).
testi8:-sentence(X,[the,dog,chased,a,black,cat,in,the,garden],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).
testi9:-sentence(X,[the,university,is,large],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).
testi10:-sentence(X,[the,man,that,we,saw,yesterday,is,my,neighbour],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).
testi11:-sentence(X,[the,yellow,canary,sings,very,well],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).
testi12:-sentence(X,[john,has,a,coffee,and,reads,the,newspaper],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).
testi13:-sentence(X,[john,is,thin,and,mary,is,tall],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).
testi14:-sentence(X,[oscar,wilde,wrote,the,canterville,ghost],[]),oracion(X,Espanol,[]),write('Español: '),write(Espanol).


%REALIZAR TODAS LAS PRUEBAS EN CONJUNTO
pruebaTodasi:-
write('1º '),iprueba1,nl,write('2º '),iprueba2,nl,write('3º '),iprueba3,nl,
write('4º '),iprueba4,nl,write('5º '),iprueba5,nl,write('6º '),iprueba6,nl,
write('7º '),iprueba7,nl,write('8º '),iprueba8,nl,write('9º '),iprueba9,nl,
write('10º '),iprueba10,nl,write('11º '),iprueba11,nl,write('12º '),iprueba12,nl,
write('13º '),iprueba13,nl,write('14º '),iprueba14.
pruebaTodas:-
write('1º '),prueba1,nl,write('2º '),prueba2,nl,write('3º '),prueba3,nl,
write('4º '),prueba4,nl,write('5º '),prueba5,nl,write('6º '),prueba6,nl,
write('7º '),prueba7,nl,write('8º '),prueba8,nl,write('9º '),prueba9,nl,
write('10º '),prueba10,nl,write('11º '),prueba11,nl,write('12º '),prueba12,nl,
write('13º '),prueba13,nl,write('14º '),prueba14.

%REALIZAR TODOS LOS TEST EN CONJUNTO
testTodas:-
test1,nl,test2,nl,test3,nl,test4,nl,test5,nl,test6,nl,test7,nl,
test8,nl,test9,nl,test10,nl,test11,nl,test12,nl,test13,nl,test14,nl.

testTodasi:-
testi1,nl,testi2,nl,testi3,nl,testi4,nl,testi5,nl,testi6,nl,testi7,nl,
testi8,nl,testi9,nl,testi10,nl,testi11,nl,testi12,nl,testi13,nl,testi14,nl.

%TODO A LA VEZ
traducir:-
write('1º '),prueba1,nl,test1,nl,iprueba1,nl,testi1,nl,nl,
write('2º '),prueba2,nl,test2,nl,iprueba2,nl,testi2,nl,nl,
write('3º '),prueba3,nl,test3,nl,iprueba3,nl,testi3,nl,nl,
write('4º '),prueba4,nl,test4,nl,iprueba4,nl,testi4,nl,nl,
write('5º '),prueba5,nl,test5,nl,iprueba5,nl,testi5,nl,nl,
write('6º '),prueba6,nl,test6,nl,iprueba6,nl,testi6,nl,nl,
write('7º '),prueba7,nl,test7,nl,iprueba7,nl,testi7,nl,nl,
write('8º '),prueba8,nl,test8,nl,iprueba8,nl,testi8,nl,nl,
write('9º '),prueba9,nl,test9,nl,iprueba9,nl,testi9,nl,nl,
write('10º '),prueba10,nl,test10,nl,iprueba10,nl,testi10,nl,nl,
write('11º '),prueba11,nl,test11,nl,iprueba11,nl,testi11,nl,nl,
write('12º '),prueba12,nl,test12,nl,iprueba12,nl,testi12,nl,nl,
write('13º '),prueba13,nl,test13,nl,iprueba13,nl,testi13,nl,nl,
write('14º '),prueba14,nl,test14,nl,iprueba14,nl,testi14,nl.
