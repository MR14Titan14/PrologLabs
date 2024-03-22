%Задание 1
%max(+X,+Y,+Z,-U) найти максимальное число из X,Y,Z 
max(X,Y,Z,X):- X>Y,X>Z,!.
max(X,Y,Z,Y):- Y>X,Y>Z,!.
max(_,_,Z,Z).

%fact(+N,X) найти факториал числа N
fact(0,1).
fact(N,X):- N>0,
    N1 is  N-1,
    fact(N1,X1),
    X is X1*N.

%call_fact2(+N,X) найти факториал числа N
fact2(0,X,X).
fact2(N,A,X):- N>0,
    N1 is N-1,
    A1 is A*N,
    fact2(N1,A1,X1),
    X is X1.
call_fact2(N,X):-fact2(N,1,X).

%cifr_sum(+N,-S) найти сумму цифр числа N
cifr_sum(0,0):-!.
cifr_sum(N,S):-N1 is N div 10,cifr_sum(N1,S1),S is S1 + N mod 10.

%cifr_sum_down(+N,-S) найти сумму цифр числа N
cifr_sum_down(N,S):-cifr_sum_down(N,S,0).
cifr_sum_down(0,S,S):-!.
cifr_sum_down(N,S,X):-X1 is X + N mod 10,N1 is N div 10,cifr_sum_down(N1,S,X1).

%call_square_free(+Number) проверить является ли число свободным от квадратов
call_square_free(Number):-square_free(Number,2).

square_free(Number,Number):-!.

square_free(Number, Squarer):-
Square is Squarer*Squarer,
Moded is Number mod Square,
Moded \= 0,
Squarer_temp is Squarer + 1,
square_free(Number,Squarer_temp).

%read_list(+N,-List) предикат чтения списка с клавиатуры
read_list(0,[]):-!.
read_list(N,[Head|Tail]) :- read(Head), NewN is N - 1,
    read_list(NewN,Tail).

%write_list(+List) предикат вывода списка
write_list([]) :- !.
write_list([H|T]) :- write(H), nl, write_list(T).

%sum_list_down(+List,?Sum) проверить является ли Sum суммой числ в списке List или же записать в Sum сумму
sum_list_down(List,Sum) :- sum_list_down(List,0,Sum).
sum_list_down([],CurSum,CurSum):-!.
sum_list_down([H|T],CurSum,Sum) :- NewSum is CurSum + H,
    sum_list_down(T,NewSum,Sum).


%read_sum_write(+Count) программа считывающая лист с клавиатуры, считающая сумму элементов и выводящая ее на экран
read_sum_write(Count):- read_list(Count,List),
sum_list_down(List,Sum),
write(Sum).

%sum_list_up(+List,-Sum)проверить является ли Sum суммой числ в списке List или же записать в Sum сумму
sum_list_up([],0):-!.
sum_list_up([H|T],Sum) :- sum_list_up(T,SumTail), Sum is SumTail + H.

%sum_cifr_del(+List,-X,+Number) предикат который удаляет все элементы списка List сумма цифр которых равна Number
sum_cifr_del([],[],Number). 
sum_cifr_del([H|T],X,Number):-cifr_sum_down(H,Sum),
Sum==Number,sum_cifr_del(T,X,Number). 
sum_cifr_del([H|X],[H|Y],Number):-sum_cifr_del(X,Y,Number). 

%Задание 2
%min_cifr(+Number,-Result) Найти минимальную цифру числа
min_cifr(Number,Result):-min_cifr(Number,10,Result).

min_cifr(0,Result,Result):-!.

min_cifr(Number,Min,Result):-Cifr is Number mod 10,
Cifr < Min,
Number_temp is Number div 10,
min_cifr(Number_temp,Cifr,Result).

min_cifr(Number,Min,Result):-
Number_temp is Number div 10,
min_cifr(Number_temp,Min,Result).

%multiply_cifr(+Number,-Result) Найти произведение цифра числа, не делящихся на 5

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

%nod(+Number1,+Number2,-Result) Найти нод 2 чисел
nod(Number1,0,Number1):-!.
nod(_,0,_):-!,fail.
nod(Number1,Number2,Result):-Ost is Number1 mod Number2, nod(Number2,Ost,Result).

%Задание 5
%simp(+Num) проверить является ли число Num простым
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

%max_nechpr(+Num, -Res) найти максимальный нечетный непростой делитель
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

%Задание 6
%findpow(+Num,-Res) определение чилса r при котором 10^r-1 кратно Num
findpow(Num,Res):-
findpow(Num,1,Res).

findpow(Num,R,Res):-
X is 10^R,
Xt is X - 1,
Ost is Xt mod Num,
Ost = 0,
Res is R,
!.

findpow(Num,R,Res):-
Rt is R + 1,
findpow(Num,Rt,Res).

%period(-Res) определить самый длинный период для дроби 1/n, где n от 1 до 1000
period(Res):-
period(1,1000,1,0,Res).

period(Num,Num,NumRes,Max,NumRes):-!.

period(Num,Nend,NumRes,Max,Res):-
nod(Num,10,Nod),
Nod = 1,
N2 is Num mod 2,
N5 is Num mod 5,
N2 \= 0,
N5 \= 0,
findpow(Num,Pow),
Pow > Max,
Numt is Num + 1,
period(Numt,Nend,Num,Pow,Res).

period(Num,Nend,NumRes,Max,Res):-
Numt is Num + 1,
period(Numt,Nend,NumRes,Max,Res).