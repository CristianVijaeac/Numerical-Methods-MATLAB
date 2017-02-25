function I=Trapez(x,y)
suma=0;
if length(x)==1
    I=0;        %Integrala pe un singur punct este intotdeauna 0
else
for i=1:length(x)-1
     suma=suma+(x(i+1)-x(i))*(y(i+1)+y(i));     %Formula metodei Trapezelor pentru puncte non-echidistante.
end
I=abs(suma/2);      %Aria nu poate avea valoarea negativa
end
end
