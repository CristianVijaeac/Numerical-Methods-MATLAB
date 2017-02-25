    function [limita_inf, limita_sup]=LimiteValProprii(d,s)

    l=length(d);
    m=length(s);
    t=0;
    
    %Formam matricea simetrica tridiagonala.
    A=diag(d);

    for i=1:m
        A(i,i+1)=s(i);
        A(i+1,i)=s(i);
    end

    %Parcurgem matricea si aplicam teorema lui Gershgorin.
    for i=1:l
        for j=1:l
            if j~=i
                t=t+abs(A(i,j));
            end
        end
        
        %Formam vectorii de valori minime si maxime.
        lambda_min(i)=A(i,i)-t;
        lambda_max(i)=A(i,i)+t;
        
        t=0;
    end
    
    %Limita inferioara,respectiv superioara este reprezentata de cel mai
    %mic,respectiv cel mai mare element din cei doi vectori de mai sus.
    limita_inf=min(lambda_min);
    limita_sup=max(lambda_max);
    end