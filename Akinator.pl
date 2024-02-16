main :-
    retractall(asked(_,_)),
    film(Question),
    !,
    nl,
    write('Your film is '), write(Question), write(.), nl.
main :-
    nl,
    write('The question cannot be solved.'), nl.



question(horror):-
    query('You wished horror?').

question(comedy):-
    query('You wished a comedy?').

question(cartoon):-
    query('You wished a cartoon?').

question(science_fiction):-
    query('You wished science fiction?').

question(thriller):-
    query('You wished a thriller?').

question(action_movie):-
    query('You wished an action movie?').
	
question(drama):-
    query('You wished a drama?').
	
question(detective):-
    query('You wished a detective story?').

question(oscar):-
    query('Did your film winned oscar?').
	
	
film(doomsday):-
    question(thriller),
	question(detective),
	question(science_fiction),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=3,!.

film(night_hunter):-
	question(thriller),
    question(detective),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

film(drive):-
	question(drama),
    question(thriller),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

film(fight_club):-
    question(thriller),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=1,!.

film(coraline):-
	question(horror),
    question(cartoon),
	question(science_fiction),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=3,!.

film(hell_boy):-
	question(horror),
    question(cartoon),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

film(alien_vs_predator):-
	question(horror),
    question(science_fiction),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

film(scary_movie):-
	question(horror),
    question(comedy),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

film(astral):-
    question(horror),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=1,!.

film(the_gentlemen):-
	question(action_movie),
    question(comedy),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.
		
film(murder_on_the_orient_express):-
	question(drama),
    question(detective),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.
	
film(soul):-
	question(cartoon),
    question(comedy),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

film(elemental):-
	question(cartoon),
    question(drama),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.
	
film(war_of_the_worlds):-
    question(action_movie),
	question(science_fiction),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.
	
film(knives_out):-
    question(comedy),
    question(detective),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.
	
film(one_plus_one):-
    question(comedy),
    question(oscar),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=2,!.

film(drujit_po_russki):-
    question(comedy),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=1,!.
	
film(shrek):-
    question(cartoon),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=1,!.
	
film(interstellar):-
    question(science_fiction),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=1,!.
	
film(operation_fortune):-
    question(action_movie),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=1,!.
	
film(the_green_mile):-
    question(drama),
    bagof(X,asked(X,y),L),
    length(L,A),
    A=1,!.



query(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.






