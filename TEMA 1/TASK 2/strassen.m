function strassen(fisier_in,fisier_out)

%citire numar N si transformarea datelor din fisier in matrice
fid=fopen(fisier_in,'r');
N=fscanf(fid,'%f',1);
A=dlmread(fisier_in);
fclose(fid);

%formam matricea A scotand prima linie care contine numarul N
[n m]=size(A);
A=A(2:n,1:m);

%calculul inversei A^-1 folosind metoda partitionarii si ridicarea la puterea N folosind
%algoritmul lui Strassen
[n n]=size(A);
A=InversaPartitionare(A);

X=RidicareLog(A,N);
%scrierea in fisier
dlmwrite(fisier_out,X,'delimiter',' ','precision','%.3f');

end
