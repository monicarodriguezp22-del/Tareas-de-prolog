lista([1,2,3,4]).

#sumar([],0).

#sumar([],R):-R=0.
#sumar([X|Y],R:sumar(Y,R1)), R is R1 +X

#ejemplo
#rotar([1,2,3,4],L,2).
#L=[3,4,1,2].
#primer enfoque
rotar(X,X,0).
rotar([X|Y],L,N):-N1 is N-1, append(Y,[X],Y1), rotar(Y1,L,N1).
#segundo enfoque
rotar[L,R,N]:-append(X,Y,L),size(X,N),append(X,Y,R).
