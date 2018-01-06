longitud([],0).
longitud([_|T],N):-
	longitud(T,N0),
	N is N0 + 1.
