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
%is_glob_max()
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

%count_min(-Count)
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

%contain_max()
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
%chetn(+N)
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