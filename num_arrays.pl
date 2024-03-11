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

%is_glob_max(+Index,+List)
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

%count_min(+List,+A,+B,-Count)
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