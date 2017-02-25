function b=ElimGaussiana(A)
[n n]=size(A);
b=eye(n);
for i=1:n
    if A(i,i)==0
        for j=i+1:n
            if A(j,j)~=0
                A([i,j],:)=A([j,i],:);
                b([i,j],:)=b([j,i],:);
            break
            end
        end
    end
   t=1/A(i,i);
   A(i,:)=A(i,:)*t;
   b(i,:)=b(i,:)*t;
    if (i+1<=n)
     for j=i+1:n
        if A(j,i)~=0
            b(j,:)=b(j,:)-A(j,i)*b(i,:);
            A(j,:)=A(j,:)-A(j,i)*A(i,:);
        end
    end
    end
    if (i>=2)
        for k=1:i-1
            b(k,:)=b(k,:)-A(k,i)*b(i,:);
            A(k,:)=A(k,:)-A(k,i)*A(i,:);
        end
    end
end
end

