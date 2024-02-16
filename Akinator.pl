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
	
	
	
film(doomsday):-
    question(thriller),
	question(detective),
	question(science_fiction).

film(night_hunter):-
	question(thriller),
    question(detective).

film(drive):-
	question(drama),
    question(thriller).

film(fight_club):-
    question(thriller).

film(coraline):-
	question(horror),
    question(cartoon),
	question(science_fiction).

film(hell_boy):-
	question(horror),
    question(cartoon).

film(alien_vs_predator):-
	question(horror),
    question(science_fiction).

film(scary_movie):-
	question(horror),
    question(comedy).

film(astral):-
    question(horror).

film(the_gentlemen):-
	question(action_movie),
    question(comedy).
		
film(murder_on_the_orient_express):-
	question(drama),
    question(detective).
	
film(soul):-
	question(cartoon),
    question(comedy).

film(elemental):-
	question(cartoon),
    question(drama).
	
film(war_of_the_worlds):-
    question(action_movie),
	question(science_fiction).
	
film(knives_out):-
    question(comedy),
    question(detective).
	
film(drujit_po_russki):-
    question(comedy).
	
film(shrek):-
    question(cartoon).
	
film(interstellar):-
    question(science_fiction).
	
film(operation_fortune):-
    question(action_movie).
	
film(the_green_mile):-
    question(drama).



query(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.






