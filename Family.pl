male(father).
male(brother).
female(mother).
female(me).

male(father_grandPa).
female(father_grandMa).
male(mother_grandPa).
female(mother_grandMa).


parent(father, brother).
parent(father, me).
parent(mother, brother).
parent(mother, me).

parent(father_grandPa, father).
parent(father_grandMa, father).
parent(mother_grandPa, mother).
parent(mother_grandMa, mother).

sibling(brother, me).
sibling(me, brother).



mother(M,C):-
	parent(M,C),female(M).
father(F,C):-
	parent(F,C),male(F).
brother(S1,S2):-
	sibling(S1,S2),male(S1).
sister(S1,S2):-
	sibling(S1,S2),female(S1).
garandparent(GP,GC):-
	parent(GP,P),parent(P,GC).
son(Son,Parent):-
	parent(Parent, Son), male(Son).
parent1(P,C):-
	mother(P,C) ; father(P,C).




