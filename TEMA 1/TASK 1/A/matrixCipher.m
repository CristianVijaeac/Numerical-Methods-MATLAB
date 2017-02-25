function matrixCipher()
fid=fopen('input1A','r');
text=fgetl(fid);
fid2=fopen('key1A','r');
numbers=LettersToNumbers(text);
l=length(numbers);
fclose(fid);
n=fscanf(fid2,'%d',1);
key=fscanf(fid2,'%d',[n,n]);
key=key';
fclose(fid2);
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
    message([1+k*n:i*n])=mod((key*block)',29);
    k=k+1;
end
message=NumbersToLetters(message);
fid3=fopen('output1A','w');
fprintf(fid3,'%s',message);
fclose(fid3);
end





