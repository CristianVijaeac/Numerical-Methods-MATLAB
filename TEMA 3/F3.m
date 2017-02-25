function F3()
fid=fopen('realmadrid.txt','r'); %deschidere fisier pentru citire

tmp=fgetl(fid);     %citire prima linie
tmp=str2num(tmp);   %transformarea caracterelor de pe prima linie in numere
m=tmp(1);       %primul numar este numarul de puncte pt care trebuie calculata valoarea functiei
nr=tmp(2);        %numarul de seturi de puncte care vor fi citite

for i=1:nr       %citim fiecare set
    v=fgetl(fid);   %citim elementele de pe linie
    v=str2num(v);   %le transformam din caractere in numere
    l=length(v);    
   
    x0=v(1:l/2);    %vectorul de puncte
    y0=v(l/2+1:l);      %vectorul de valori in functie ale punctelor de mai sus
    n=length(x0);
    
    for i=1:n-1    %daca punctele nu sunt in ordine,le ordonam
        for j=i:n
            if (x0(i)>x0(j))
                 aux=x0(i);
                x0(i)=x0(j);    %interschimbam cele 2 valori gasite
                x0(j)=aux;
    
                aux2=y0(i);
                y0(i)=y0(j);    %interschimba valorile functiilor pt cele 2 puncte gasite
                y0(j)=aux2;
            end
        end
    end
    
    x=linspace(x0(1),x0(n),m);      %generam cele m puncte noi pentru care calculam f(x)
    
    for k=1:length(x)
        y(k)=SC2Naturale(x(k),x0,y0);   %pentru fiecare punct,aplicam metoda spline-urilor de clasa C2 naturale
    end
    
    hold on;
    plot (x,y); %generam desenul
end
fclose(fid);    %inchidem fisierul pe care l-am citit
end