function C=InmultireStrassen(A,B)

[lin,col]=size(A);
aux1=lin;
[lin2,col2]=size(B);
aux2=col2;
L=[lin,col,lin2,col2];
while (lin<max(L))
    A(lin+1,1:col)=0;
    lin=lin+1;
end
while (max(L)>col)
    A(1:lin,col+1)=0;
    col=col+1;
end
while (lin2<max(L))
    B(lin2+1,1:col2)=0;
    lin2=lin2+1;
end
while (max(L)>col2)
    B(1:lin2,col2+1)=0;
    col2=col2+1;
end

[l,l]=size(A);
aux=l;


while floor(log2(aux))~=log2(aux)
    A(1:aux+1,aux+1)=0;
    B(1:aux+1,aux+1)=0;
    aux=aux+1;
end
if (aux>=32)
m=round(aux/2);
A1=A(1:m,1:m);
A2=A(1:m,m+1:aux);
A3=A(m+1:aux,1:m);
A4=A(m+1:aux,m+1:aux);

B1=B(1:m,1:m);
B2=B(1:m,m+1:aux);
B3=B(m+1:aux,1:m);
B4=B(m+1:aux,m+1:aux);
    
M1=InmultireStrassen(A1+A4,B1+B4);
M2=InmultireStrassen(A3+A4,B1);
M3=InmultireStrassen(A1,B2-B4);
M4=InmultireStrassen(A4,B3-B1);
M5=InmultireStrassen(A1+A2,B4);
M6=InmultireStrassen(A3-A1,B1+B2);
M7=InmultireStrassen(A2-A4,B3+B4);

C=[M1+M4-M5+M7 M3+M5;M2+M4 M1+M3-M2+M6];

else
    C=A*B;

end

    C=C(1:aux1,1:aux2);
end

