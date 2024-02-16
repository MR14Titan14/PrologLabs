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
	
	
	
film('Doomsday'):-
    question(thriller),
	question(detective),
	question(science_fiction).

film('Night Hunter'):-
	question(thriller),
    question(detective).

film('Drive'):-
	question(drama),
    question(thriller).

film('Fight Club'):-
    question(thriller).

film('Coraline'):-
	question(horror),
    question(cartoon),
	question(science_fiction).

film('Hell Boy'):-
	question(horror),
    question(cartoon).

film('Alien vs. Predator'):-
	question(horror),
    question(science_fiction).

film('Scary Movie'):-
	question(horror),
    question(comedy).

film('Astral'):-
    question(horror).

film('The Gentlemen'):-
	question(action_movie),
    question(comedy).
		
film('Murder on the Orient Express'):-
	question(drama),
    question(detective).
	
film('Soul'):-
	question(cartoon),
    question(comedy).

film('Elemental'):-
	question(cartoon),
    question(drama).
	
film('War of the Worlds'):-
    question(action_movie),
	question(science_fiction).
	
film('Knives Out'):-
    question(comedy),
    question(detective).
    
film('Astral'):-
    question(horror).
	
film('Drujit po russki'):-
    question(comedy).
	
film('Shrek'):-
    question(cartoon).
	
film('Interstellar'):-
    question(science_fiction).
	
film('Operation Fortune'):-
    question(action_movie).
	
film('The Green Mile'):-
    question(drama).



query(Prompt) :-
    (   asked(Prompt, Reply) -> true
    ;   nl, write(Prompt), write(' (y/n)? '),
        read(X),(X = y -> Reply = y ; Reply = n),
	assert(asked(Prompt, Reply))
    ),
    Reply = y.






