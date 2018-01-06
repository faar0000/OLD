factorial(0,1).
factorial(N,_):-N<0,!,fail.
factorial(X,Y):-
	X>0,
	X1 is X-1,
	factorial(X1,Y1),
	Y is X*Y1.
