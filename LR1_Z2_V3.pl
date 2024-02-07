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

%Задание 2


%Построить предикат daughter(X, Y), который проверяет, является ли X дочерью Y.
%daughter(+X,+Y)
daughter(X,Y):-parent(Y,X),woman(X).

%Построить предикат, daughter(X), который выводит дочь X.
%daughter(+X)
daughter(X):-daughter(K,X), print(K),!.

%Построить предикат wife(X, Y), который проверяет, является ли X женой Y.
%wife(+X,+Y)
wife(X,Y):-parent(X,K),parent(Y,K),woman(X).

%Построить предикат wife(X), который выводит жену X.
%wife(+X)
wife(X):-wife(K,X), print(K),!.