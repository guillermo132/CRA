
%DETERMINATES
articulo(m(art_1),f,sg) --> [la].
articulo(m(art_1),m,sg) --> [el].
articulo(m(art_1),f,pl) --> [las].
articulo(m(art_2),f,sg) --> [una].
articulo(m(art_3),f,pl) --> [ ].
articulo(m(art_4),_,_) --> [un].


%NOMBRES
nombre(n(n_1),m,sg) --> [hombre].
nombre(n(n_2),f,sg) --> [manzana].
nombre(n(n_3),f,pl) --> [manzanas].
nombre(n(n_4),m,sg) --> [gato].
nombre(n(n_5),m,sg) --> [raton].
nombre(n(n_6),f,sg) --> [universidad].
nombre(n(n_7),m,sg) --> [alumno].
nombre(n(n_8),m,sg) --> [perro].
nombre(n(n_9),m,sg) --> [jardin].
nombre(n(n_10),m,sg) --> [vecino].
nombre(n(n_11),m,sg) --> [canario].
nombre(n(n_12),m,sg) --> [cafe].
nombre(n(n_13),m,sg) --> [periodico].
nombre(n(n_14),m,sg) --> [fantasma].


%NOMBRES PROPIOS
nom_p(np(np_1),pl) --> [ellos].
nom_p(np(np_2),sg) --> [tu].
nom_p(np(np_3),sg) --> [juan].
nom_p(np(np_4),sg) --> [maria].
nom_p(np(np_5),sg) --> [oscar].
nom_p(np(np_6),sg) --> [wilde].
nom_p(np(np_7),pl)--> [nosotros].
nom_p(np(np_8),sg) --> [canterville].


%VERBOS
verbo(v(v_1),sg) --> [come].
verbo(v(v_2),pl) --> [comen],!.
verbo(v(v_2),sg) --> [comes],!.
verbo(v(v_3),sg) --> [ama].
verbo(v(v_4),sg) --> [estudia].
verbo(v(v_5),sg) --> [persiguio].
verbo(v(v_6),sg) --> [es].
verbo(v(v_7),pl) --> [vimos].
verbo(v(v_8),sg) --> [canta].
verbo(v(v_9),sg) --> [toma].
verbo(v(v_10),sg) --> [lee].
verbo(v(v_11),sg) --> [escribio].



%ADJETIVOS
adjetivos(adj(adj_1),_) --> [roja].
adjetivos(adj(adj_2),m) --> [grande].
adjetivos(adj(adj_2),f) --> [grande].
adjetivos(adj(adj_3),_) --> [gris].
adjetivos(adj(adj_4),_) --> [negro].
adjetivos(adj(adj_5),_) --> [delgado].
adjetivos(adj(adj_6),_) --> [alta].
adjetivos(adj(adj_7),_) --> [amarillo].

%CONJUNCIONES
conjunciones(conj(conj_1)) --> [y].

%PRONOMBRES
pronombres(pron(pron_1)) --> [mi].
pronombres(pron(pron_2)) --> [que].


%PREPOSIONES
preposiciones(prep(prep_1),m) --> [de].
preposiciones(prep(prep_2),f) --> [en].
preposiciones(prep(prep_2),m) --> [en].

%ADVERBIO
adverbio(adv(adv_1)) --> [muy].
adverbio(adv(adv_2)) --> [ayer].
adverbio(adv(adv_3)) --> [bien].







