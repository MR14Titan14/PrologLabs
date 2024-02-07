man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).
man(rostislav).
man(rostislavchik).

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

parent(ratibor, rostislav).
parent(zhdana, rostislav).
parent(ratibor, rostislavchik).
parent(zhdana, rostislavchik).

brother(X,Y):- parent(K,Y), parent(K,X), man(X), man(K), X\=Y.

%Задание 3

%Построить предикат grand_so(X, Y), который проверяет, является ли X внуком Y. Без использования готовых предикатов.
%grand_so(+X,+Y)
grand_so(X,Y):-parent(Y,K),parent(K,X),man(X).

%Построить предикат grand_sons(X), который выводит всех внуков X. Без использования готовых предикатов.
%grand_so(+X)
grand_so(X):-parent(X,K),parent(K,Z),print(Z),man(Z),nl,fail.

%Построить предикат grand_sons(X), который выводит всех внуков X. С использования готовых предикатов.
%grand_so(+X)
grand_so(X):-grand_so(Z,X),print(Z),nl,fail.

%Построить предикат grand_ma_and_son(X,Y), который проверяет, являются ли X и Y бабушкой и внуком или внуком и бабушкой. Без использования готовых предикатов.
%grand_ma_and_son(+X,+Y)
grand_ma_and_son(X,Y):-parent(Y,K),parent(K,X),man(X),woman(Y);parent(X,K),parent(K,Y),man(Y),woman(X).

%Построить предикат grand_ma_and_son(X,Y), который проверяет, являются ли X и Y бабушкой и внуком или внуком и бабушкой. С использованием готовых предикатов.
%grand_ma_and_son(+X,+Y)
grand_ma_and_son(X,Y):-grand_so(X,Y),woman(Y);grand_so(Y,X),woman(X).

%Построить предикат, который проверяет, является ли X дядей Y. Без использования готовых предикатов.
%uncle(+X,+Y)
uncle(X,Y):-parent(K,Y),parent(Z,K),parent(Z,X),man(X),man(K),man(Z),X\=K.

%Построить предикат, который проверяет, является ли X дядей Y. C использованием готовых предикатов.
%uncle(+X,+Y)
%uncle(X,Y):-parent(K,Y),brother(X,K),man(X).

%Построить предикат, который выводит всех дядей X.
uncles(X):-uncle(K,X),print(K),nl,fail.