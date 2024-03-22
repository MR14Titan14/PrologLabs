%read_list(+N,-List)
read_list(0,[]):-!.
read_list(N,[Head|Tail]) :- read(Head), NewN is N - 1,
    read_list(NewN,Tail).

%write_list(+List)
write_list([]) :- !.
write_list([Head|Tail]) :- write(Head), nl, write_list(Tail).

%count(+List,+Element,-Count)
%Подсчитывает количество вхождений элемента Element в список List, количество вхождений сохраняет в Count
count(List, Element, Count):-
  findall(Element, member(Element, List), Counters),
  length(Counters, Count).

%slice(+List,+From,+To,-Result)
%Возвращает список элементов между элементами с индексами From и To списка List
slice(List, From, To, Result):-
  Fromt is From + 1, Tot is To + 1,
  length(LFrom, Fromt),
  length([_|LTo], Tot),
  append(LTo, _, List),
  append(LFrom, Result, LTo).

%Задание 3
%is_glob_max() Определить является ли элемент по указанному индексу глобальным максимумом
is_glob_max():-
write('Enter number of elements: '),
read(N),
read_list(N,List),
write('Enter index of element: '),
read(Index),
nth0(Index,List,Number),
max_list(List,Max),
Number =:= Max,
count(List,Number,Count),
Count =:= 1.

%count_min(-Count) найти количество минимальных элементов в интервале a, b
count_min(Count):-
write('Enter number of elements: '),
read(N),
read_list(N,List),
write('Enter index A: '),
read(A),
write('Enter index B: '),
read(B),
min_list(List,Min),
slice(List,A,B,Sublist),
count(Sublist,Min,Count).

%contain_max() проверить наличие максимального элемента в интервале a, b
contain_max():-
write('Enter number of elements: '),
read(N),
read_list(N,List),
write('Enter index A: '),
read(A),
write('Enter index B: '),
read(B),
max_list(List,Max),
slice(List,A,B,Sublist),
member(Max,Sublist).

%Задание 7
%chetn(+N) Вывести сначала элементы на четных позициях, потом на нечетных
chetn([],_):-!.

chetn(N):-
read_list(N,List),
chetn(List,1).

chetn([H|T],1):-
chetn(T,2),
chetn([H|T],2).

chetn([H|T],Index):-
Ost is Index mod 2,
Ost = 0,
write(H),write(' '),
Indext is Index + 1,
chetn(T, Indext).

chetn([H|T],Index):-
Indext is Index + 1,
chetn(T, Indext).

%intfl(+N) Проверить чередуются ли целые и вещественные числа
intfl([],_):-!.

intfl(N):-read_list(N,List),
intfl(List,0).

intfl([H|T],0):-
integer(H),
intfl(T,1).

intfl([H|T],0):-
not(integer(H)),
intfl(T,2).

intfl([H|T],1):-
not(integer(H)),
intfl(T,2).

intfl([H|T],2):-
integer(H),
intfl(T,1).

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

%delp(+Num,+Del,-Res) определить в какой максимальной степени делитель Del является делителем числа Num
delp(Num,Del,Res):-
delp(Num,Del,1,1,Res).

delp(Num,Del,Num,Max,Max):-!.

delp(Num,Del,Power,Max,Res):-
Pow is Del ^ Power,
Ost is Num mod Pow,
Ost = 0,
Powert is Power + 1,
delp(Num,Del,Powert,Power,Res).

delp(Num,Del,Power,Max,Res):-
Powert is Power + 1,
delp(Num,Del,Powert,Max,Res).

%listn(+N,+R,-Res) добавить в список элемент N R раз
listn(N,R,Res):-
listn(N,R,[],Res).


listn(N,0,TList,TList):-!.

listn(N,R,TList,Res):-
append(TList,[N],TListt),
Rt is R - 1,
listn(N,Rt,TListt,Res).

%prost_del(+N,-Ldel)1.52. Для введенного числа построить список всех его простых делителей, причем если введенное число делится на простое число p в степени n, то в итоговом списке число должно повторятся n раз.

prost_del(N,Ldel):-
prost_del(N,2,[],Ldel).

prost_del(N,N,Ldel,Ldel):-!.

prost_del(N,Del,List,Ldel):-
Ost is N mod Del,
Ost = 0,
simp(Del),
delp(N,Del,Raz),
listn(Del,Raz,ApList),
append(List,ApList,Listt),
Delt is Del + 1,
prost_del(N,Delt,Listt,Ldel).

prost_del(N,Del,List,Ldel):-
Delt is Del + 1,
prost_del(N,Delt,List,Ldel).

%moreSum(+N,-Res) Для введенного списка найти количество таких элементов, которые больше, чем сумма всех предыдущих.
moreSum(N,Res):-read_list(N,List),
moreSum(List,0,0,Res).

moreSum([],Sum,Count,Count):-!.

moreSum([H|T],Sum,Count,Res):-
H > Sum,
Countt is Count + 1,
Sumt is Sum + H,
moreSum(T,Sumt,Countt,Res).

moreSum([H|T],Sum,Count,Res):-
Sumt is Sum + H,
moreSum(T,Sumt,Count,Res).