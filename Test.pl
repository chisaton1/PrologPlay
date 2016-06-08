dog(wolfie).
cat(falco).
cat(tom).
fish(nemo).
likes(wolfie, falco).
likes(X,Y):-
	cat(X), fish(Y).
likes(X,Z):-
	likes(X,Y),likes(Y,Z).


