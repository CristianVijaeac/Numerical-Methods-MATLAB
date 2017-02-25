    function [valp,vecp]=PutereInv(d,s,h,y,maxIter,eps)
    
    %Initializam y(0)(la pasul 0).
    l=length(d);
    y=y;
    lambda=0;

    %Aplicam algoritmul pentru un numar fix de iteratii.
    for i=1:maxIter
        
        %Calculam solutiile sistemului de ecuatii(vectorul z) folosind algoritmul lui
        %Thomas.
        z=Thomas(d-h,s,y);
        
        %Construim y la pasul urmator(y la pasul i).
        y=z/norm(z,2);
        
        %Pentru a actualiza valoarea lui lambda cautat,trebuie calculata
        %inmultirea dintre vectorul y mentionat mai sus si matricea
        %noastra,fara a construii matricea.
        p(1)=y(1)*d(1)+y(2)*s(1);
        p(l)=y(l-1)*s(l-1)+y(l)*d(l);
        for j=2:l-1
            p(j)=y(j-1)*s(j-1)+y(j)*d(j)+y(j+1)*s(j);
        end
        
        %Actualizam lambda.
        lambda=p*y';
        
        %Actualizam valoarea deplasarii.
        h=lambda;
        
        %Daca conditia aceasta este indeplinita,ne oprim.
        if norm(p-h*y)<eps
            break;
        end
    end
    
    %Ultima valoarea a lui lambda este valoarea cautata.
    valp=lambda;
    
    %Y construit la ultimul pas reprezinta vectorul de valori proprii
    %aferent lui lambda.
    vecp=y;

    end
