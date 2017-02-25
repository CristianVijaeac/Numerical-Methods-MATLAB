CERINTA 1
	Pentru rezolvarea acestei cerinte am folosit functia "ValoriPolinoame" care primeste ca parametrii vectorul care contine elementele de pe diagonala ale matricii,
vectorul care contine elementele de pe diagonala inferioara si superioara a matricii(fiind o matrice simetrica tridiagonala,elementele de pe cele 2 diagonale sunt 
identice) si o valoarea lambda.Functia returneaza un vector format din valorile fiecarui polinom din sirul de polinoame caracteristice ale matricii calculate in functie
de lambda.
	Pasi:
		1)Calculam primele doua valori ale primelor 2 polinoame din sirul polinoamelor caracteristice(utilizate pentru aflarea urmatoarelor valori)
		2)Construim celelalte polinoame(numarul lor este egal cu dimensiunea matricii) in mod recursiv utilizand celelalte 2 polinoame aflate la pasii anteriori si 
		calculam valoarea acestora in lambda.
		3)Intrucat cele doua polinoame care vor construii noul polinom trebuie scazute,vectorii coeficientilor acestora trebuie sa aibe dimensiuni egale.In cazul
		in care cei doi vectori nu au dimensiuni egale,umplem vectorul mai mic cu zerouri pana la atingerea dimensiunii vectorului mai mare.
		4)Calculam valoarea noului polinom in lambda.
		5)Fixam urmatoarele doua polinoame utilizate in recursivitate.

CERINTA 2
	Pentru rezolvarea acestei cerinte am folosit functia "NrValProprii" care primeste ca parametrii vectorul care contine elementele de pe diagonala ale matricii,
vectorul care contine elementele de pe diagonala inferioara si superioara a matricii(fiind o matrice simetrica tridiagonala,elementele de pe cele 2 diagonale sunt 
identice) si o valoarea lambda.Functia returneaza un numar reprezentand numarul de valori proprii ale matricii mai mici decat lambda dat.
	Pasi:
		1)Calculam valoarea polinoamelor caracteristice aflate la punctul anterior in punctul val_lambda primit ca parametru(folosind functia "ValoriPolinoame").
		2)Parcurgem sirul de valori ale polinoamelor caracteristice.
		3)Daca valoarea polinomului in punctul lambda este 0,semnul acesteia(valorii) va fi semnul opus valorii anterioare gasite.
		4)Daca produsul dintre valoarea polinomului de la pasul curent si valoarea polinomului de la pasul urmatorul este mai mic decat 0,inseamna ca am gasit 
		o valoarea proprie care respecta conditia de mai sus,astfel numarul acestora se incrementeaza cu 1.

CERINTA 3
	Pentru rezolvarea acestei cerinte am folosit functia "LimiteValProprii" care primeste ca parametrii vectorul care contine elementele de pe diagonala ale matricii si
vectorul care contine elementele de pe diagonala inferioara si superioara a matricii(fiind o matrice simetrica tridiagonala,elementele de pe cele 2 diagonale sunt 
identice) .Functia calculeaza si returneaza limita inferioara si limita superioara intre care se afla toate valorile proprii ale matricii.
	Pasi:
		1)Construim matricea tridiagonala simetrica.
		2)Parcurgem matricea construita mai sus,element cu element, si aplicam teorema lui Gershgorin.
		3)Formam vectorul care contine valorile minime ale fiecarei linii(gasite scazand din elementul de pe diagonala suma modulelor celorlalte elemente de pe linie).
		4)Formam vectorul care contine valorile maxime ale fiecarei linii(gasite adunand la elementul de pe diagonala suma modulelor celorlalte elemente de pe linie).
		5)Limita inferioara va fi valoarea minima din vectorul de valori minime.
		6)Limita superioara va fi valoarea maxima din vectorul de valori maxime.

CERINTA 4
	Pentru rezolvarea acestei cerinte am folosit functia "IntervaleValProprii" care primeste ca parametrii vectorul care contine elementele de pe diagonala ale matricii,
vectorul care contine elementele de pe diagonala inferioara si superioara a matricii(fiind o matrice simetrica tridiagonala,elementele de pe cele 2 diagonale sunt 
identice) si numarul m reprezentand numarul primelor m cele mai mici valori proprii pentru care trebuie sa calculam intervalele.Functia cauta primele m intervale in care
se afla O SINGURA valoare proprie.
	Pasi:
		1)Calculam limitele intre care se situeaza toate valorile proprii(folosind functia "LimiteValProprii").
		2)In cazul in care numarul de valori proprii cautate m este mai mare decat dimensiunea matricii,inseamna ca vrem sa cautam toate intervalele intre care
		se situeaza fiecare valoare proprie a matricii.
		3)Fixam limita inferioara,orice valoarea proprie fiind mai mare decat aceasta limita.
		4)Luam o variabila auxiliara,r(m+2) necesara pentru calculul limitei superioare a intervalului aferent ultimei valori proprii cautate[r(m+1)]. 
		5)Cautarea se va face in mod invers,calculandu-se capetele superioare ale intervalelor in care se afla valorile proprii cautate.
		6)Calculam mijlocul intervalului pe care lucram si distanta de la acesta pana la capatul superior al intervalului.
		7)Cat timp numarul de valori cautate este diferit de numarul de valori gasite,continuam cautarea.
		8)Calculam numarul de valori propii mai mici decat valoarea de mijloc a intervalului(folosind functia "NrValProprii") si injumatatim distanta dintre mijloc si capatul superior.
		9)Daca numarul de valori proprii gasit este mai mic decat numarul de valori proprii cautate,mijlocul se va marii cu h(se va muta catre capatul superior).
		10)Daca numarul de valori prorii gasit este mai mare decat numarul de valori prorii cautate,mijlocul se va micsora cu h(se va muta catre capatul inferior).
		11)Limita superioara a intervalului in care se afla k(pasul la care ne aflam) valori proprii devine egala cu mijlocul.
		12)Construim vectorul de intervale,ignorand valoarea auxiliara de la inceput.

CERINTA 5
	Pentru rezolvarea acestei cerinte am folosit functia "CalculezValProprii" care primeste ca parametrii vectorul care contine elementele de pe diagonala ale matricii,
vectorul care contine elementele de pe diagonala inferioara si superioara a matricii(fiind o matrice simetrica tridiagonala,elementele de pe cele 2 diagonale sunt 
identice),numarul m reprezentand numarul primelor m cele mai mici valori proprii pe care trebuie sa le calculam si o toleranta "eps".Functia calculeaza valoarea primelor
m cele mai mici valori prorii.
	Pasi:
		1)In cazul in care numarul de valori proprii cautate m este mai mare decat dimensiunea matricii,inseamna ca vrem sa calculam toate valorile proprii ale matricii.
		2)Calculam intervalele intre care se afla cele m valori proprii cautate(apeland functia "IntervaleValProprii").
		3)Parcurgem fiecare interval in care se afla o singura valoare proprie.
		4)Fixam capatul inferior,superior si mijlocul intervalului.
		5)Calculam valoarea polinomului caracteristic in mijloc(folosind functia "ValoriPolinoame").
		6)Algoritmul urmator se va repeta pana cand valoarea polinomului in mijlocul intervalului(care in acest caz va reprezenta valoarea proprie cautata)
		este cat mai apropiata de 0(mai mica decat toleranta data).
		7)Calculam un nou mijloc,injumatatind intervalul pe care lucram de fiecare data.
		8)Calculam valoarea polinoamelor caracteristice in limita inferioara si in mijloc(folosind functia "ValoriPolinoame").
		9)Daca valoara polinomului in mijloc este chiar 0,atunci mijloc este chiar valoara proprie cautata.
		10)Daca produsul dintre valoarea polinomului in capatul inferior si valoare polinomului in mijloc e mai mic decat 0,atunci intervalul se injumatateste 
		avand capatul superior in mijloc.
		11)Daca produsul este pozitiv,intervalul se injumatateste avand capatul inferior in mijloc.
		12)O data atinsa acea toleranta,valoarea proprie cautata de noi la un pas este valoarea mij(mijlocul intervalului).

CERINTA 6
	Pentru rezolvarea acestei cerinte am folosit functia "PutereInv" care primeste ca parametrii vectorul care contine elementele de pe diagonala ale matricii,
vectorul care contine elementele de pe diagonala inferioara si superioara a matricii(fiind o matrice simetrica tridiagonala,elementele de pe cele 2 diagonale sunt 
identice),numarul h reprezentand deplasarea in jurul careia cautam valoarea proprie,un vector y reprezentand vectorul initial(la pasul 0) de valori prorii,un numar 
maxim de pasi(iteratii) maxIter si o toleranta "eps".Functia calculeaza valoare proprie cea mai apropiata de o deplasare data si vectorul de valori proprii aferent 
valorii gasite.Functia foloseste metoda puterii inverse.
	Pasi:
		1)Initializam y(0)(vectorul de valori proprii la pasul initial).
		2)Aplicam algoritmul puterii inverse de maxIter ori(precizia creste de la un pas la celalalt).
		3)Calculam vectorul "z" ca fiind vectorul de solutii al sistemului de ecuatii (A-h*I)*z=y.Neavand voie sa construim matricea A,vom folosi functia "Thomas" pentru calculul
		acestor solutii.Functia primeste ca parametrii vectorul diagonala din care scadem valoarea deplasarii,h,vetorul cu elementele de pe diagonala inferioara
		si cea superioara si vectorul y reprezentand vectorul de rezultate.Functia "Thomas" calculeaza solutiile in mod recursiv si invers,pornind de la aflarea 
		solutie i cunoscund solutia i+1.Functia returneaza vectorul de solutii.
		4)Dupa aflarea lui z,construim y la pasul urmator.
		5)Pentru aflarea valorii lambda,am realizat,mai intai,inmultirea dintre vectorul y,aflat mai sus, si matricea A,inmultire pe care am adaptat-o folosindu-ma numai
		de vectorii d si s.Rezultatul va fi inmultit cu y'.
		6)Actualizam valoarea deplasarii,aceasta devenind chiar lambda mentionat mai sus.
		7)Daca conditia urmatoarea este indeplinita,nu se mai tine cont de numarul de iteratii si se opreste functia.
		8)La final,valoarea proprie va fi egala cu ultima valoarea determinata a lui lambda,iar vectorul de valori proprii va fi egal cu ultima actualizare a 
		vectorului y.