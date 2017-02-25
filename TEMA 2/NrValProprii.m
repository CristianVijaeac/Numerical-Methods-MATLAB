    function numvp=NrValProprii(d,s,val_lambda)

    alpha=val_lambda;
    
    %Calculam valoarea fiecarui polinom caracteristic intr-un punct alpha
    %primit ca parametru.
    P=ValoriPolinoame(d,s,alpha);
    l=length(P);
    numvp=0;
    
    %Verificam cate valori proprii,mai mici decat lambda primit,exista.
    for i=1:l-1
         
         %Daca valoarea unui polinom este 0,semnul lui este considerat opus
         %valorii polinomului anterior.
         if P(i)==0
            P(i)=-P(i-1);
         end
         
         if P(i+1)==0
            P(i+1)=-P(i);
         end
         
         %Daca produsul dintre valoarea unui polinom si valoarea
         %polinomului urmator este negativ,inseamna ca am gasit o valoarea
         %proprie.
         if P(i)*P(i+1)<0
            numvp=numvp+1;
         end
    end
    
    end
