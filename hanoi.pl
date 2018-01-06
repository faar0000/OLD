hanoi(1,A,B,C,[A-B]). hanoi(N,A,B,C,L):- N>1, N1 is N-1, hanoi(N1,A,C,B,L1), hanoi(N1,C,B,A,L2), append(L1,[A-B|L2],L).
