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

%sum_cifr_del(+List,-X,+Number)
sum_cifr_del([],[],Number). 
sum_cifr_del([H|T],X,Number):-cifr_sum_down(H,Sum),
Sum==Number,sum_cifr_del(T,X,Number). 
sum_cifr_del([H|X],[H|Y],Number):-sum_cifr_del(X,Y,Number). 

%Задание 2
%min_cifr(+Number,-Result)
min_cifr(Number,Result):-min_cifr(Number,10,Result).

min_cifr(0,Result,Result):-!.

min_cifr(Number,Min,Result):-Cifr is Number mod 10,
Cifr < Min,
Number_temp is Number div 10,
min_cifr(Number_temp,Cifr,Result).

min_cifr(Number,Min,Result):-
Number_temp is Number div 10,
min_cifr(Number_temp,Min,Result).

%multiply_cifr(+Number,-Result)

multiply_cifr(Number,Result):-multiply_cifr(Number,1,Result).

multiply_cifr(0,Result,Result):-!.

multiply_cifr(Number,Mult, Result):-
Cifr is Number mod 10,
(Cifr \= 5 -> Mult_temp is Mult * Cifr),
Number_temp is Number div 10,
multiply_cifr(Number_temp,Mult_temp,Result).

multiply_cifr(Number,Mult, Result):-
Number_temp is Number div 10,
Mult_temp is Mult,
multiply_cifr(Number_temp,Mult_temp,Result).

%nod(+Number1,+Number2,-Result)
nod(Number1,0,Number1):-!.
nod(_,0,_):-!,fail.
nod(Number1,Number2,Result):-Ost is Number1 mod Number2, nod(Number2,Ost,Result).

%Задание 5
%simple(+Num)
simp(Num):-
Counter is Num div 2,
simp(Num,Counter).

simp(Num,1):-!.


simp(Num,Counter):-
Simpl is Num mod Counter,
Simpl \= 0,
Countert is Counter - 1,
simp(Num, Countert).

%prost_del(+Num,-Res) Найти максимальный простой делитель
prost_del(Num,Res):-
prost_del(Num,2,Max,Res).

prost_del(Num,Num,Max,Max):-!.

prost_del(Num,Del,Max,Res):-
Ost is Num mod Del,
Ost = 0,
simp(Del),
Delt is Del + 1,
prost_del(Num,Delt,Del,Res).

prost_del(Num,Del,Max,Res):-
Delt is Del + 1,
prost_del(Num,Delt,Max,Res).

%max_nechpr(+Num, -Res)
max_nechpr(Num,Res):-
max_nechpr(Num,2,1,Res).

max_nechpr(Num,Del,Max,Max):-Numt is Num + 1,
Del = Numt,!.

max_nechpr(Num,Del,Max,Res):-
simp(Del),
Delt is Del + 1,
max_nechpr(Num, Delt, Max, Res).

max_nechpr(Num,Del,Max,Res):-
Chet is Del mod 2, Chet = 0,
Delt is Del + 1,
max_nechpr(Num, Delt, Max, Res).

max_nechpr(Num,Del,Max,Res):-
Ost is Num mod Del,
Ost \= 0,
Delt is Del + 1,
max_nechpr(Num, Delt, Max, Res).


max_nechpr(Num,Del,Max,Res):-
Delt is Del + 1,
max_nechpr(Num, Delt, Del, Res).

%nod_max_nechet(+Num, -Res) Найти НОД максимального нечетного непростого делителя числа и произведения его цифр
nod_max_nechet(Num,Res):- max_nechpr(Num,Nechpr),
multiply_cifr(Num,Mult),
nod(Nechpr,Mult,Res).