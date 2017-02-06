:-consult('c:/Users/Francisco/Desktop/Practica _2/diccionario.pl').

oracion --> g_nominal,g_verbal.

g_nominal -->nombre.

g_nominal --> determinante,nombre.
g_nominal -->nombre,adjetivo.


g_verbal --> verbo.
g_verbal --> verbo,g_nominal.
g_verbal--> verbo,adjetivo.
