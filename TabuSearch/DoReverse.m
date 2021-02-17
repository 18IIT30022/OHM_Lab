function q=DoReverse(p,i1,i2)
    q=p;
    if i1>i2
        i2=i1;
    end
    temp=i2;
    for i=i1:1:i2
        q(temp)=p(i);
        temp=temp-1;
    end
        
end