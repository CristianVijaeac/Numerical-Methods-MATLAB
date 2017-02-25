    function vp=CalculezValProprii(d,s,m,eps)

    %Daca numarul de valori proprii cautate este mai mare decat
    %dimensiunea matricii,reinitializam numarul m.
    l=length(d);
    if m>l
        m=l;
    end
    
    %Calculam intervalele intre care se afla fiecare dintre cele m valori proprii cautate.
    r=IntervaleValProprii(d,s,m);

    %Parcurgem fiecare interval in care se afla o singura valoare proprie.
    for i=1:length(r)-1
        
        %Fixam capatul inferior,mijlocul si capatul superior al
        %intervalului mai sus mentionat.
        a=r(i);
        b=r(i+1);
        c=(a+b)/2;
    
        %Valoarea polinomului in mijloc.
        P1=ValoriPolinoame(d,s,c);
    
        %Injumatatim intervalul pe care cautam valoarea proprie pana cand
        %ne apropiem suficient de mult de 0.
        while (abs(P1(l+1))>eps)
            c=(a+b)/2;
        
            P1=ValoriPolinoame(d,s,c);
            P2=ValoriPolinoame(d,s,a);
        
            %Daca valoarea polinomului in mijloc este chiar 0,am gasit
            %valoarea proprie cautata.
            if P1(l+1)==0
                vp(i)=c;
                break;
            else
                
                %Daca produsul dintre cele 2 valori ale celor 2 polinoame
                %caracteristice este 0,limita superioara a intervalului
                %devine mijlocul.
                if P1(l+1)*P2(l+1)<0
                    b=c;
            
                %Daca produsul este pozitiv,limita inferioara a
                %intervalului devine mijlocul.
                else
                        a=c;
                end   
            end
      
        end
        
    %Construim vectorul de valori proprii cautate.
    vp(i)=c;
    end
    
    end
            