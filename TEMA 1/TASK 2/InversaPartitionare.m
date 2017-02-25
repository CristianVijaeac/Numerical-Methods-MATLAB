function X=InversaPartitionare(A)

[n n]=size(A);
X=eye(n);
k=floor(n/2);

while (det(A(1:k,1:k))==0)||(det(A(k+1:n,k+1:n))==0)
    k=k-1;
end

if n==1
    X=1/A;
else
    
if n>=16
A1=A(1:k,1:k);
A2=A(k+1:n,1:k);
A3=A(1:k,k+1:n);
A4=A(k+1:n,k+1:n);

[n1 n1]=size(A1);
[n4 n4]=size(A4);
    
    a=InversaPartitionare(A1);
    b=InversaPartitionare(A4);
    
    X1=InversaPartitionare(A1-InmultireStrassen(A3,InmultireStrassen(b,A2)));
    X2=(-1)*InmultireStrassen(InmultireStrassen(b,A2),X1);
    X4=InversaPartitionare(A4-InmultireStrassen(InmultireStrassen(A2,a),A3));
    X3=(-1)*InmultireStrassen(InmultireStrassen(a,A3),X4);

    X=[[X1 X3];[X2 X4]];
else

X=ElimGaussiana(A);

end
end
end
