% Nombre y Apellido: Tomás Giacoboni

% Punto 1
viveEn(juan, casa(120)).
viveEn(nico, departamento(3, 2)).
viveEn(alf, departamento(3, 1)).
viveEn(julian, loft(2000)).
viveEn(vale, departamento(4, 1)).
viveEn(fer, casa(110)).
viveEn(rocio, casa(90)).
viveEn(felipe, desconocido).

viveEnBarrio(juan, almagro).
viveEnBarrio(nico, almagro).
viveEnBarrio(alf, almagro).
viveEnBarrio(julian, almagro).
viveEnBarrio(vale, flores).
viveEnBarrio(fer, flores).

% Punto 2
barrioCopado(Barrio) :-
    viveEnBarrio(_, Barrio),
    forall(viveEnBarrio(Persona, Barrio), (viveEn(Persona, Propiedad), esCopada(Propiedad))).

esCopada(casa(Metros)) :-
    Metros > 100.
esCopada(departamento(Ambientes, _)) :-
    Ambientes > 3.
esCopada(departamento(_, Banios)) :-
    Banios > 1.
esCopada(loft(Anio)) :-
    Anio > 2015.

% Punto 3
barrioCaro(Barrio) :-
    propiedadesDelBarrio(Barrio, Propiedades),
    not(hayPropiedadBarata(Propiedades)).

propiedadesDelBarrio(Barrio, Propiedad) :-
    viveEnBarrio(_, Barrio),
    viveEn(_, Propiedad),
    findall(Propiedad,  (viveEnBarrio(Persona, Barrio), viveEn(Persona, Propiedad)), Propiedades).

hayPropiedadBarata(Propiedades) :-
    member(Propiedad, Propiedades),
    esBarata(Propiedad).
    
esBarata(casa(Metros)) :-
    Metros =< 90.
esBarata(departamento(Ambiente, _)) :-
    Ambiente =< 2.
esBarata(loft(Anio)) :-
    Anio < 2005.

% Punto 4
precioDe(propiedad(juan), 150000).
precioDe(propiedad(nico), 80000).
precioDe(propiedad(alf), 75000).
precioDe(propiedad(julian), 140000).
precioDe(propiedad(vale), 95000).
precioDe(propiedad(fer), 60000).

sublista([], []).
sublista([_|Cola], Sublista) :- 
    sublista(Cola, Sublista).
sublista([Cabeza|Cola], [Cabeza|Sublista]):- 
    sublista(Cola, Sublista).

/* No me salio este ejercicio, no supe como plantearlo */