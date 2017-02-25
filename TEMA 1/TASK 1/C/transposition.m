function transposition()
fid=fopen('input1C','r');
k=fscanf(fid,'%d',1);
n=fscanf(fid,'%d',2);
text=fgetl(fid);
fclose(fid);
numbers=LettersToNumbers(text);
l=length(numbers);
key=eye(n+1);
key(1:n,n+1)=k;
fid2=fopen('key1C','w');
for i=1:size(key,1)
    fprintf(fid2,'%d',key(i,:));
    fprintf(fid2,'\n');
end
fclose(fid2);
x=floor(l/1000);
y=mod(1000,n);
for i=1:x 
    key=eye(n+1);
    key(1:n,n+1)=k;
    aux(1:1000)=numbers((i-1)*1000+1:i*1000);
    if y~=0
            aux(1001:1000-y+n)=1;
    end
    for j=1:length(aux)/n
       transposition(((i-1)*1000+1)+(j-1)*n:((i-1)*1000)+j*n+1)=key*([aux((j-1)*n+1:j*n),1])';
    end
    k=k+1;
end
ltransp=length(transposition);
if y~=0
    transposition=transposition(1:ltransp+y-n-1);
ltransp=length(transposition);
else
    transposition=transposition(1:ltransp-1);
end

rest=mod(l,1000);    
% cazul particular
    tmp(1:rest)=numbers(x*1000+1:x*1000+rest);
    ltmp=length(tmp);
    while mod(ltmp,n)~=0
        tmp(ltmp+1)=1;
       ltmp=ltmp+1;
    end
    
   key=eye(n+1);
    key(1:n,n+1)=k;
    for i=1:(ltmp/n)
        transposition((ltransp+1)+n*(i-1):ltransp+n*i+1)=key*([tmp((i-1)*n+1:i*n),1])';
    end
    
ltransp=length(transposition);
z=mod(rest,n);
if z~=0
transposition=transposition(1:ltransp+z-n-1);
ltransp=length(transposition);
else
    transposition=transposition(1:ltransp-1);
end

transposition=mod(transposition,29);
codified=NumbersToLetters(transposition);
fid3=fopen('output1C','w');
fprintf(fid3,'%s',codified);
fclose(fid3);        
end