function J=Simpson(x,y)
suma=0;
J=0;
if length(x)==1
    J=0;        %Integrala pentru un singur punct este intotdeauna zero
else
for i=1:2:length(x)-2
    h=x(i+2)-x(i);  %Distanta unui interval
    J=J+h/6*(y(i)+4*y(i+1)+y(i+2));     %Formula metodei Simpson pentru puncte non-echidistante
end
end
J=abs(J);  %Aria nu poate fi negativa
end
