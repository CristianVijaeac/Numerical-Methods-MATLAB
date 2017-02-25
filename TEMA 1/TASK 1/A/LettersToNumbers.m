function numbers=LettersToNumbers(text)
n=length(text);
text=lower(text);
numbers(1:n)=double(text(1:n))-96;
for i=1:n
    if (numbers(i)==-64) 
        numbers(i)=0;
    end
    if(numbers(i)==-50)
        numbers(i)=27;
    end
    if(numbers(i)==-57)
        numbers(i)=28;
    end
end
end
