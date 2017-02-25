function decrypt()
fid=fopen('input1B','r');
text=fgetl(fid);
numbers=LettersToNumbers(text);
l=length(numbers);
fclose(fid);
fid2=fopen('key1B','r');
n=fscanf(fid2,'%d',1);
key=fscanf(fid2,'%d',[n,n]);
key=key';
fclose(fid2);
key2=InverseModulo(key);
for i=1:n-1
    if (mod(l+i,n))==0;
        numbers(l+i)=0;
        l=length(numbers);
    end
end
k=0;
for i=1:l/n
    block=numbers([1+k*n:i*n]);
    block=block';
    mdecodified([1+k*n:i*n])=mod((key2*block)',29);
    k=k+1;
end
mdecodified=NumbersToLetters(mdecodified);
fid3=fopen('output1B','w');
fprintf(fid3,'%c',mdecodified);
fclose(fid3);
end
