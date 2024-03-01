%Задание 1
%max(+X,+Y,+Z,-U)
max(X,Y,Z,X):- X>Y,X>Z,!.
max(X,Y,Z,Y):- Y>X,Y>Z,!.
max(_,_,Z,Z).

%fact(+N,X)
fact(0,1).
fact(N,X):- N>0,
    N1 is  N-1,
    fact(N1,X1),
    X is X1*N.

%call_fact2(+N,X)
fact2(0,X,X).
fact2(N,A,X):- N>0,
    N1 is N-1,
    A1 is A*N,
    fact2(N1,A1,X1),
    X is X1.
call_fact2(N,X):-fact2(N,1,X).

%cifr_sum(+N,-S)
cifr_sum(0,0):-!.
cifr_sum(N,S):-N1 is N div 10,cifr_sum(N1,S1),S is S1 + N mod 10.

%cifr_sum_down(+N,-S)
cifr_sum_down(N,S):-cifr_sum_down(N,S,0).
cifr_sum_down(0,S,S):-!.
cifr_sum_down(N,S,X):-X1 is X + N mod 10,N1 is N div 10,cifr_sum_down(N1,S,X1).

%call_square_free(+Number)
call_square_free(Number):-square_free(Number,2).

square_free(Number,Number):-!.

square_free(Number, Squarer):-
Square is Squarer*Squarer,
Moded is Number mod Square,
Moded \= 0,
Squarer_temp is Squarer + 1,
square_free(Number,Squarer_temp).

%read_list(+N,-List)
read_list(0,[]):-!.
read_list(N,[Head|Tail]) :- read(Head), NewN is N - 1,
    read_list(NewN,Tail).

%write_list(+List)
write_list([]) :- !.
write_list([H|T]) :- write(H), nl, write_list(T).

%sum_list_down(+List,-Sum)
sum_list_down(List,Sum) :- sum_list_down(List,0,Sum).
sum_list_down([],CurSum,CurSum):-!.
sum_list_down([H|T],CurSum,Sum) :- NewSum is CurSum + H,
    sum_list_down(T,NewSum,Sum).


%read_sum_write(+Count)
read_sum_write(Count):- read_list(Count,List),
sum_list_down(List,Sum),
write(Sum).

%sum_list_up(+List,-Sum)
sum_list_up([],0):-!.
sum_list_up([H|T],Sum) :- sum_list_up(T,SumTail), Sum is SumTail + H.

%sum_cifr_del()
sum_cifr_del([],[],Number). 
sum_cifr_del([H|T],X,Number):-cifr_sum_down(H,Sum),
Sum==Number,sum_cifr_del(T,X,Number). 
sum_cifr_del([H|X],[H|Y],Number):-sum_cifr_del(X,Y,Number). 