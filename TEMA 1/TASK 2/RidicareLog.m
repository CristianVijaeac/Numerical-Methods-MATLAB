function X=RidicareLog(A,N)
if N==1
	X=A;
else
X=RidicareLog(A,floor(N/2));
if mod(N,2)==0
	X=InmultireStrassen(X,X);
else
	X=InmultireStrassen(InmultireStrassen(X,X),A);
end
end
end
