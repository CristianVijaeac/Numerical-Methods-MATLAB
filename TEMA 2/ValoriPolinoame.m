    function P=ValoriPolinoame(d ,s ,val_lambda )
        
        l=length(d);
        lambda=val_lambda;
        
        %Calculam primele 2 valori ale primelor 2 polinoame caracteristice
        %in functie de lambda.
        P0=[1];
        P1=d(1)-lambda;
        P(1)=P0;
        P(2)=P1;

        %Construim celelalte polinoame caracteristice recursiv,in functie
        %de celelalte 2 aflate anterior si le calculam valoarea in lambda.
        for i=2:l
            m=length(P0);
            n=length(P1);
        
            %Formam zerouri astfel incat dimensiunea celor doi vectori
            %reprezentand cele doua polinoame sa fie egale.
            if (m>n)
                P1(m-n+1:m)=P1(1:n);
                P1(1:m-n)=0;
            end
            
            if (n>m)
                P0(n-m+1:n)=P0(1:m);
                P0(1:n-m)=0;
            end
      
        %Calculam valoarea in lambda a noului polinom.
        P(i+1)=(d(i)-lambda)*P1-s(i-1)^2*P0;
        
        %Fixam urmatoarele 2 polinoame utilizate in recursivitate.
        P0=P1;
        P1=P(i+1);
        end
    end
