room(kitchen).
room(office).
room(hall).
room('dining room').
room(cellar).

door(office, hall).
door(kitchen, office).
door(hall, 'dining room').
door(kitchen, cellar).
door('dining room', kitchen).

edible(apple).
edible(crackers).

tastes_yucky(broccoli).

turned_off(flashlight).
asserts(here(kitchen)).

where_food(X,Y) :-
  location(X,Y),
  edible(X).
where_food(X,Y) :-
  location(X,Y),
  tastes_yucky(X).

connect(X,Y) :- door(X,Y).
connect(X,Y) :- door(Y,X).

list_things(Place) :-
  location(X, Place),
  tab(2),
  write(X),
  nl,
  fail.
list_things(_).


list_connections(Place) :-
  connect(Place, X),
  tab(2),
  write(X),
  nl,
  fail.
list_connections(_).


look :-
  here(Place),
  write('You are in the '), write(Place), nl,
  write('You can see:'), nl,
  list_things(Place),
  write('You can go to:'), nl,
  list_connections(Place).

can_go(Place):-
  here(X),
  connect(X, Place).
can_go(Place):-
  write('You can''t get there from here.'), nl,
  fail.

move(Place):-
  retract(here(X)),
  asserta(here(Place)).


goto(Place):-
  can_go(Place),!, %sitakara modorenai uekara ha OK
  move(Place),
  look.

can_take(desk) :-
	write("You can't carry a desk!"),
	!,fail.

can_take(computer) :-
	write("A computer is too heavy to carry!"),
	!,fail.

can_take("washing machine") :-
	write('No way!'),
	!,fail.

can_take(Thing) :-
  here(Place),
  location(Thing, Place).

can_take(Thing) :-
  write('There is no '), write(Thing),
  write(' here.'),
  nl, fail.

take_object(X):-
  retract(location(X,_)),
  asserta(have(X)),
  write('taken'), nl.

take(X):-
  can_take(X),!,
  take_object(X).

is_contained_in(T1,T2) :-
  location(T1,T2),!.

is_contained_in(T1,T2) :-
  location(X,T2),
  is_contained_in(T1,X).

restart:- clear,start.


start :- asserta(here(kitchen)),
	%asserta(have(_)),
	asserta(location(desk, office)),
	asserta(location(apple, kitchen)),
	asserta(location(flashlight, desk)),
	asserta(location('washing machine', cellar)),
	asserta(location(nani, 'washing machine')),
	asserta(location(broccoli, kitchen)),
	asserta(location(crackers, kitchen)),
	asserta(location(computer, office)),
	asserta(location(envelope, desk)),
	asserta(location(stamp, envelope)),
	asserta(location(key, envelope)).


clear :- retractall(here(_)),
	retractall(heve(_)),
	retractall(location(_,_)).
%clear :- retract(here(X)), fail. dottimo onaji

startOver :- retract(here(X)),
	asserta(here(kitchen)).

inventory :-
	have(X),
	tab(2),
	write(X),
	nl,
	fail.
%inventory.



