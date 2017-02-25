    function r=IntervaleValProprii(d,s,m)
    
    %Calculam limitele intre care se situeaza valorile proprii.
    [limita_inf, limita_sup]=LimiteValProprii(d,s);

    %Daca numarul de valori proprii cautate este mai mare decat
    %dimensiunea matricii,reinitializam numarul m.
    l=length(d);
    if m>l
        m=l;
    end
    
    %Prima valoare proprie va fi intotdeauna mai mare decat limita
    %inferioara.
    r(1)=limita_inf;
   
    %Limita superioara este folosita numai pt a calcula elementul r(m+1).
    r(m+2)=limita_sup;
    mij=0;
    h=0;
    numvp=0;

    %Pornim cautarea primelor m cele mai mici valori proprii. 
    for k=m:-1:1
        
        %Calculam mijlocul intervalului [r(1),r(k+2)].
        mij=(r(k+2)+r(1))/2;
        
        %Calculam distanta de la mijloc la limita superioara(r(k+2)).
        h=r(k+2)-mij;
       
        %Cautam cat timp numarul de valori proprii gasite este diferit de numarul
        %de valori proprii cautate.
        while (numvp~=k)
            
            %Calculam numarul de valori proprii mai mici decat mij.
            numvp=NrValProprii(d,s,mij);
            
            %Injumatatim distanta.
            h=h/2;
            
            %In functie de numarul de valori proprii gasite la pasul
            %anterior,ne alegem noul interval de cautare.
            if numvp<k
                mij=mij+h;
            end
            
            if numvp>k
                mij=mij-h;
            end
        end
        
    %Limita superioara a intervalului in care se afla K valori proprii devine egala cu valoare mij.    
    r(k+1)=mij;
    end
    
    %Construim vectorul de intervale,ignorand valoarea auxiliara de la
    %inceput.
    r=r(1:m+1);
    end
        
