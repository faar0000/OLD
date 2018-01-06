fibo(0,0).
fibo(1,1).
fibo(X,Y):-
	X>1,
	A is X-1,B is X-2,
	fibo(A,AA),fibo(B,BB),
	Y is AA+BB.
