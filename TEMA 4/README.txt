TEMA 4

	Pentru rezolvarea tuturor cerintelor din aceasta tema este necesara rularea unei singure functii "CenterOfFighterJet"
care primeste ca parametru locatia fisierelor din care se vor lua datele pentru prelucrat.In functie de cerinta,functia preia
datele dintr-un anumit fisier de intrare si apeleaza o alta functie necesara rezolvarii unei cerinte.Functiile secundare care
rezolva aceasta tema sunt:
	
	1)Trapez-functia trapez primeste parametrii x si y reprezentand vectorii de coordonate ale unor puncte care formeaza
o suprafata reprezentand o sectiune transversala a avionului.Functia calculeaza aria suprafetei utilizand Metoda Trapezelor
pentru aproximarea integralei.Initial,aceasta verifica daca avem un singur punct(varful),caz in care integrala va fi nula.In
caz contrar functia calculeaza integrala folosind metoda trapezelor avand puncte non echidistante(functia imparte suprafata
in mai multe trapeze si calculeaza aria acestora cu formula clasica a ariei trapezele,suma acestora reprezentand aria intregii
suprafete).Functia returneaza valoarea integralei.

	2)Simpson-functia primeste parametrii x si y reprezentand vectorii de coordonate ale unor puncte ce formeaza
o suprafata reprezentand o sectiune transversala a avionului.Functia calculeaza aria suprafetei utilizand Metoda Simpson
pentru aproximarea integralei.Initial,aceasta verifica daca avem un singur punct(varful),caz in care integrala va fi nula.In
caz contrar functia calculeaza integrala folosind metoda Simpson normala avand puncte non echidistante(functia creeaza un set de
polinoame si calculeaza aria delimitata de graficul acestora,suma lor reprezentand aria intregii suprafete).Functia 
returneaza valoarea integralei.

	3)CentroidOfSurface-functia primeste parametrii x si y reprezentand vectorii de coordonate ale punctelor ce 
delimiteaza conturul avionul.Folosind metoda descrisa aici:http://en.wikipedia.org/wiki/Centroid (sectiunea "Centroid of Polygon")
functia calculeaza coordonatele centroidului(punctul de intersectie al tuturor medianelor laturilor) folosind formulele
descrise in sectiunea mai sus mentionata si returneaza coordonatele x0 si y0 ale acestuia.

	4)VolumeOfPlane-functia primeste ca parametrii ariile a 2 suprafete consecutive si coordonatele z ale acestora.Functia 
calculeaza volumul delimitat de cele 2 suprafete ca functie de arii si distanta dintre cele 2 suprafete(diferenta dintre coordonatele
z ale acestora).Functia returneaza volumul.In functia principala "CenterOfFighterJet" se aduna toate aceste volume dintre
suprafete,aceasta suma reprezentand volumul total al avionului.

	5)MassOfPlane-functia primeste ca parametrii volumul dintre 2 suprafete consecutive,calculat cu ajutorul functiei
de mai sus si densitatea aferenta corpului delimitat de cele 2 suprafete.Cunoscand formula densitatii:masa/volum,deducem formula
masei:densitate*volum si astfel functia returneaza masa dintre cele 2 suprafete.In functia principala "CenterOfFighterJet" 
se aduna toate aceste mase dintre suprafete,aceasta suma reprezentand masa totala a avionului.

	Pentru ultima cerinta,calculul centrului de masa al avionului,se citesc coordonatele x,y si z din fiecare fisier de intrare
(coordonatele punctelor fiecarei suprafete).Citirea se va face fara coordonatele varfului,deoarece acestea au fost memorate
anterior intrucat functia va calcula centrul de masa avand ca punct de referinta(origine) varful avionului.Initial,functia
calculeaza centroidul(coordonatele x si y) pentru fiecare suprafata apeland functia CentroidOfSurface,functie care
de data aceasta primeste ca parametrii distanta dintre coordonatele suprafetei si coordonatele varfului(explicatia mai sus).Astfel se vor forma 2 vectori
x si y a caror elementele reprezinta coordonatele pe axa x,respectiv y a centroidului fiecarei suprafete.Pentru determinarea coordonatei z 
a centroidelor nu este necesara apelarea functiei CentroidOfSurface intrucat aceasta coordonata este constanta pentru fiecare
suprafata in parte(z-ul centroidului pt o suprafata este egal cu coordonata z a suprafetei).
	Pentru calculul centrului de masa al intregului avion folosim formula mediei ponderate :http://en.wikipedia.org/wiki/Weighted_arithmetic_mean
(prima formula enuntat in sectiunea "Mathematical definition").Din nou,vom calcula coordonatele acestui punct in raport cu varful avionului
(originea devine varful).De aceea vom gasi,in cele 3 formule din functie ale mediei ponderate,diferenta x,y,z-coord.x,y,z.a.varfului.
	Media ponderata calculeaza raportul dintre produsul coordonatei centroidului unei suprafete si masa acestei suprafete ,si masa totala
a avionului.Suma tuturor acestor medii(tuturor mediilor ponderate de pe fiecare suprafata) va reprezenta coordonata centrului de masa a avionului.

	