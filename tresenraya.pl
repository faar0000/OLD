  /*********************/
 /*** 3 EN RAYA 2.0 ***/
/*********************/

/* Tablero 3 en raya:

	|1 2 3|
	|4 5 6|
	|7 8 9|

Se considera un array de 9 elementos. Cada elemento puede valer:
	-v: la posición # está vacía
	-o: la posición # fue seleccionada por el jugador 1
	-x: la posición # fue seleccionada por el jugador 2 / IA
*/

% MÉTODOS AUXILIARES

% Posiciones ganadoras

	% Horizontales
	win([E,E,E,_,_,_,_,_,_]):-
		estado_valido(E).
	win([_,_,_,E,E,E,_,_,_]):-
		estado_valido(E).
	win([_,_,_,_,_,_,E,E,E]):-
		estado_valido(E).

	% Verticales
	win([E,_,_,E,_,_,E,_,_]):-
		estado_valido(E).
	win([_,E,_,_,E,_,_,E,_]):-
		estado_valido(E).
	win([_,_,E,_,_,E,_,_,E]):-
		estado_valido(E).

	% Diagonales
	win([E,_,_,_,E,_,_,_,E]):-
		estado_valido(E).
	win([_,_,E,_,E,_,E,_,_]):-
		estado_valido(E).

	estado_valido(o).
	estado_valido(x).

% Proclamar ganador

	winner(Mesa,Jugador):-
		win(Mesa),
		write('GANADOR: '),
		write(Jugador),
		nl.

% Proclamar tablas (empate)

	tablas([E1,E2,E3,E4,E5,E6,E7,E8,E9]):-
		\+ vacio(E1),
		\+ vacio(E2),
		\+ vacio(E3),

		\+ vacio(E4),
		\+ vacio(E5),
		\+ vacio(E6),

		\+ vacio(E7),
		\+ vacio(E8),
		\+ vacio(E9).

	vacio(v).

% Mira quién gana 	/ gana(+L,?E) -> comprueba si E gana

	gana([E,E,E,_,_,_,_,_,_],E).
	gana([_,_,_,E,E,E,_,_,_],E).
	gana([_,_,_,_,_,_,E,E,E],E).

	gana([E,_,_,E,_,_,E,_,_],E).
	gana([_,E,_,_,E,_,_,E,_],E).
	gana([_,_,E,_,_,E,_,_,E],E).

	gana([E,_,_,_,E,_,_,_,E],E).
	gana([_,_,E,_,E,_,E,_,_],E).


% Lista movimientos 	/ mov(+H,+V,-N) -> convierte la posición introducida (fila,columna) en número (N)

	mov(1,a,1).
	mov(1,b,2).
	mov(1,c,3).

	mov(2,a,4).
	mov(2,b,5).
	mov(2,c,6).

	mov(3,a,7).
	mov(3,b,8).
	mov(3,c,9).

% Estado de una posición	/ estado(+Pos,+L,-E) -> devuelve el elemento (E) en la posición (Pos) de una lista (L)
	
	estado(1,[C|_],C).
	estado(Pos,[_|R],E):-
		Pos2 is Pos-1,
		estado(Pos2,R,E).

	posicion_libre(N,Mesa):-
		estado(N,Mesa,v).

% Insertar movimiento en Mesa en la posición indicada	/ mover(+H,+V,+E,+Mesa,-Mesa2)

	movimiento(N,E,Mesa,Mesa2):-
		estado(N,Mesa,v),
		insert(E,N,Mesa,Mesa2).

	insert(E,1,[_|L1],[E|L1]).							%/ insert(+E,+Pos,+L,-L2) -> inserta en la posición Pos de L el elemento E
	insert(E,Pos,[C|R],[C|R2]):-
		Pos1 is Pos-1,
		insert(E,Pos1,R,R2). 

% Iniciar Mesa

	iniciar([v,v,v,v,v,v,v,v,v]).

% Imprimir posición

	imp(o):-
		write(o).
	imp(x):-
		write(x).
	imp(v):-
		write(' ').

% Imprimir Mesa

	imprimir([E1,E2,E3,E4,E5,E6,E7,E8,E9]):-
		write('   _a_ _b_ _c_ '),
		nl,
		write('1 | '),
		imp(E1),
		write(' | '),
		imp(E2),
		write(' | '),
		imp(E3),
		write(' |'),
		nl,
		write('2 | '),
		imp(E4),
		write(' | '),
		imp(E5),
		write(' | '),
		imp(E6),
		write(' |'),
		nl,
		write('3 | '),
		imp(E7),
		write(' | '),
		imp(E8),
		write(' | '),
		imp(E9),
		write(' |'),
		nl,
		nl.

% Pedir posición

	pide_fila(X):-
		write('Fila: '),
		nl,
		read(X).

	pide_columna(Y):-
		write('Columna: '),
		nl,
		read(Y).

	pedir(N):-
		pide_fila(X),
		pide_columna(Y),
		mov(X,Y,N).

% Copiar(+L1,-L2)

	copiar(L1,L2):-
		append([],L2,L1). 



% JUEGO

jugar(_):-
	nl,
	write('Modo de juego? (1: Jugador vs Jugador | 2: Jugador vs IA): '),
	read(Modo),
	iniciar(Mesa),
	nl,
	imprimir(Mesa),
	turno(Mesa,Modo);
	jugar(_).

% MODO Jugador vs Jugador

turno(Mesa,1):-
	write('JUGADOR 1 (o):'),
	nl,
	jugador(Mesa,Mesa2),
	\+ winner(Mesa2,'Jugador 1'),
	\+ tablas(Mesa2),
	write('JUGADOR 2 (x):'),
	nl,
	jugador2(Mesa2,Mesa3),
	\+ winner(Mesa3,'Jugador 2'),
	\+ tablas(Mesa3),
	turno(Mesa3,1).

% MODO Jugador vs IA

turno(Mesa,2):-
	write('JUGADOR 1:'),
	nl,
	jugador(Mesa,Mesa2),
	\+ winner(Mesa2,'Jugador 1'),
	write('IA:'),
	nl,
	ia(Mesa2,Mesa3),
	\+ winner(Mesa3,'Jugador 2'),
	turno(Mesa3,2).

% Usuario

jugador(Mesa,Mesa2):-
	pedir(N),
	movimiento(N,o,Mesa,Mesa2),
	imprimir(Mesa2).

jugador2(Mesa,Mesa2):-	% Jugador 2
	pedir(N),
	movimiento(N,x,Mesa,Mesa2),
	imprimir(Mesa2).

% IA

ia(Mesa,MesaFin):-
	write('# Duplicando Mesa ...'),
	nl,
	copiar(Mesa,Mesa2),
	write('# Sacando número ...'),
	nl,
	%sacar_numero(Mesa2,9,8,N),
	a(Mesa2,9,N),
	movimiento(N,x,Mesa,MesaFin),
	imprimir(MesaFin).


/*
sacar_numero(_,1,1,_):-!.

sacar_numero(Mesa,Cont,0,N):-
	write('# Probadas todas las posiciones "o" para "x" en la posicion '),
	write(Cont),
	write(' por lo que decrementamos esta a '),
	Cont2 is Cont-1,
	write(Cont2),
	write(' ...'),
	nl,
	sacar_numero(Mesa,Cont2,9,N).

sacar_numero(Mesa,Cont,Cont2,N):-

	% Ponemos la "x" en la posición Cont
	Cont =\= Cont2,
	write('# Probando colocar "x" en la posicion '),
	write(Cont),
	nl,
	movimiento(Cont,x,Mesa,Mesa2),

	% En caso de que queden espacios por rellenar y no se haya ganado
	\+ gana(Mesa2,x),
	\+ tablas(Mesa2),

	% ponemos la o en l aposición Count2
	write('# Con la "o" en la posicion '),
	write(Cont2),
	nl,
	movimiento(Cont2,o,Mesa2,Mesa3),
	\+ gana(Mesa3,0),
	\+ tablas(Mesa3),

	write('# La tabla quedaria asi:'),
	nl,
	imprimir(Mesa3),
	ContAux is Cont2-1,
	sacar_numero(Mesa3,Cont,ContAux,N);

	% En caso contrario
	write('# Probando otro ...'),
	nl,
	ContAux2 is Cont2-1,
	sacar_numero(Mesa,Cont,ContAux2,N).
*/


seria_ganador(Mesa,N,N):-
	gana(Mesa,x).

a(_,1,_):-!.
a(Mesa,Cont,N):-
	write('# a) Probamos "x" en la posicion '),
	write(Cont),
	nl,
	% Posicion Libre
	movimiento(Cont,x,Mesa,Mesa2),
	imprimir(Mesa2),
	\+ seria_ganador(Mesa2,Cont,N),
	write('# a) Probamos todas las combinaciones de esta solucion con "o"s'),
	nl,
	b(Mesa2,Cont,9,N);

	% Falla o Posicion Ocupada
	\+ posicion_libre(Cont,Mesa),
	write('# a) Posicion '),
 	write(Cont),
 	write(' ocupada. Probamos por lo tanto '),
	Cont2 is Cont-1,
	write(Cont2),
	nl,
	a(Mesa,Cont2,N).

b(_,_,1,_):-!.
b(Mesa,ContAux,Cont,N):-
	write('	# b) Probamos "o" en la posicion '),
	write(Cont),
	nl,
	% Posicion Libre
	posicion_libre(Cont,Mesa),
	movimiento(Cont,o,Mesa,Mesa2),
	imprimir(Mesa2),
	\+ tablas(Mesa),
	write('	# b) Probamos todas las combinaciones de esta solucion con "x"s'),
  	nl,
	a(Mesa2,ContAux,N);

	% Posicion Ocupada
	\+ posicion_libre(Cont,Mesa),
	write('	# b) Posicion '),
 	write(Cont),
 	write(' ocupada. Probamos por lo tanto la posicion '),
	Cont2 is Cont-1,
	write(Cont2),
	nl,
	b(Mesa,ContAux,Cont2,N).