function message=NumbersToLetters(message)
l=length(message);
for i=1:l
    if message(i)==0
        message(i)=32;
    else
    if message(i)==27
        message(i)=46;
    else
    if message(i)==28
        message(i)=39;
    else
    if ((message(i)~=0) && (message(i)~=27) && (message(i)~=28))
        message(i)=message(i)+96;
    end
    end
    end
    end
    message=char(message);
end
end