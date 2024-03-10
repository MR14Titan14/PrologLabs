%read_list(+N,-List)
read_list(0,[]):-!.
read_list(N,[Head|Tail]) :- read(Head), NewN is N - 1,
    read_list(NewN,Tail).

%write_list(+List)
write_list([]) :- !.
write_list([Head|Tail]) :- write(Head), nl, write_list(Tail).

%count(+List,+Element,-Count)
count(List, Element, Count):-
  findall(Element, member(Element, List), Counters),
  length(Counters, Count).

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
