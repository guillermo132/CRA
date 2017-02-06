
%ARTICULOS
article(m(art_1),_,_)--> [the].
article(m(art_2),_,pl)--> [a].
article(m(art_2),_,sg)--> [an].
article(m(art_3),_,_)-->[some].
article(m(art_4),_,_)--> [a].

 

%NOMBRES
noun(n(n_1),m,sg)--> [man].
noun(n(n_2),f,sg)--> [apple].
noun(n(n_3),f,pl)--> [apples].
noun(n(n_4),m,sg)--> [cat].
noun(n(n_5),m,sg)--> [mouse].
noun(n(n_6),f,sg)--> [university].
noun(n(n_7),m,sg)--> [student].
noun(n(n_8),m,sg)--> [dog].
noun(n(n_9),m,sg)--> [garden].
noun(n(n_10),m,sg)--> [neighbour].
noun(n(n_11),m,sg)--> [canary].
noun(n(n_12),m,sg)--> [coffee].
noun(n(n_13),m,sg)--> [newspaper].
noun(n(n_14),m,sg)--> [ghost].


%NOMBRES PROPIOS
noun_p(np(np_1),pl)--> [they].
noun_p(np(np_2),sg)--> [you].
noun_p(np(np_3),sg)--> [john].
noun_p(np(np_4),sg)--> [mary].
noun_p(np(np_5),sg)--> [oscar].
noun_p(np(np_6),sg)--> [wilde].
noun_p(np(np_7),pl)--> [we].
noun_p(np(np_8),sg) --> [canterville].


%VERBOS
verb(v(v_1),sg)-->[eats].
verb(v(v_2),pl)-->[eat],!.
verb(v(v_2),sg)-->[eat],!.
verb(v(v_3),sg)-->[loves].
verb(v(v_4),sg)-->[studies].
verb(v(v_5),sg)-->[chased].
verb(v(v_6),sg)-->[is].
verb(v(v_7),pl)-->[saw].
verb(v(v_8),sg)-->[sings].
verb(v(v_9),sg)-->[has].
verb(v(v_10),sg)-->[reads].
verb(v(v_11),sg)-->[wrote].



%ADJETIVOS
adjective(adj(adj_1),_)-->[red].
adjective(adj(adj_2),m)-->[big].
adjective(adj(adj_2),f)-->[large].
adjective(adj(adj_3),_)-->[grey].
adjective(adj(adj_4),_)-->[black].
adjective(adj(adj_5),_)-->[thin].
adjective(adj(adj_6),_)-->[tall].
adjective(adj(adj_7),_)-->[yellow].

%PREPOSICIONES
preposition(prep(prep_1),_)-->[ ].
preposition(prep(prep_2),f)-->[at].
preposition(prep(prep_2),m)-->[in].


%CONJUNCIONES
conjuction(conj(conj_1))-->[and].


%PRONOMBRES
pronoms(pron(pron_1))-->[my].
pronoms(pron(pron_2))-->[that].


%ADVERBIO
adverb(adv(adv_1))-->[very].
adverb(adv(adv_2))-->[yesterday].
adverb(adv(adv_3))-->[well].





