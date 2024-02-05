man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

%Задание 1
%Построить предикаты men и women, которые выводят на экран всех мужчин и всех женщин соответственно.
men():- man(X), print(X), nl, fail.
women():- woman(X), print(X), nl, fail.

%Построить предикат, который children(X), который выводит всех детей X.
%children(+X)
children(X):- parent(X,Y),print(Y),nl,fail.

%Построить предикат mother(X, Y), который проверяет, является ли X матерью Y.
%mother(+X, +Y)
mother(X,Y):- parent(X,Y), woman(X).
%Построить предикат, mother(+X), который выводит маму X.
%mother(+X)
mother(X):- woman(parent(Y,X)),print(Y),nl,fail.

%Построить предикат brother(X, Y), который проверяет, является ли X братом Y.
%brother(+X,+Y)
brother(X,Y):- parent(K,Y), parent(K,X), man(X), man(K), X\=Y.
%Построить предикат brothers(X), который выводит всех братьев X.
%brothers(+X)
brothers(X):- brother(K,X),print(K), nl, fail.
%Построить предикат b_s(X,Y), который проверяет, являются ли X и Y родными братом и сестрой или братьями или сестрами.
%b_s(+X,+Y)
b_s(X,Y):- parent(K,Y), parent(K,X), man(K), X\=Y.
%Построить предикат b_s(X), который выводит всех братьев или сестер X.
%b_s(+X)
b_s(X):- b_s(K,X),print(K), nl, fail.