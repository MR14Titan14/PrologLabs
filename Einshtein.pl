%Задание 4
%in_list добавить в список
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

%pr_ein На заводе работали три друга: слесарь, токарь и сварщик. Их фамилии Борисов, Иванов и Семенов. У слесаря нет ни братьев, ни сестер. Он самый младший из друзей. Семенов, женатый на сестре Борисова, старше токаря. Назвать фамилии слесаря, токаря и сварщика.
pr_ein:-Workers=[_,_,_,_],
         
        in_list(Workers,[_,_,3,semenov]),
        in_list(Workers,[_,true,_,borisov]),
        in_list(Workers,[_,_,_,ivanov]),


		in_list(Workers,[tokar,_,2,WHO1]),
		in_list(Workers,[slesar,false,1,WHO2]),
        in_list(Workers,[svarshik,_,_,WHO3]),
		write('Tokar - '),write(WHO1),nl,
        write('Slesar - '),write(WHO2),nl,
        write('Svarshik - '),write(WHO3).

%Задание 8
%prsStud Три друга – Петр, Роман и Сергей учатся на математическом, физическом и химическом факультетах университета. Если Петр математик, то Сергей не физик. Если Роман не физик, то Петр – математик. Если Сергей не математик, то Роман – химик. Где учится Роман?
prsStud:-
        Students=[_,_,_,_],
        in_list(Students,[petr,Fac1]),
        in_list(Students,[roman,Fac2]),
        in_list(Students,[sergey,Fac3]),

        in_list(Students,[_,matematik]),
        in_list(Students,[_,fizik]),
        in_list(Students,[_,himik]),

        ((Fac1=matematik,
        Fac3\=F);
        (Fac2\=F,
        Fac1=matematik);
        (Fac3\=matematik,
        Fac2=himik)),

        write('Roman: '),write(Fac2).
