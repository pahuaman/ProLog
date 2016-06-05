hanoi(N):-move(N,'A','C','B').
 	
 	move(0,_,_,_):-!.
 	move(N,Src,Dest,Spare):-M is N-1,
 				move(M,Src,Spare,Dest),
 				primitive(Src,Dest),
 				move(M,Spare,Dest,Src).
 	
 	primitive(X,Y):-writelist([move, a, disk, from, X, to, Y]),
 			nl.
 	
 	writelist([]).
 	writelist([H|T]):-write(H),
 			write(' '),
 			writelist(T).