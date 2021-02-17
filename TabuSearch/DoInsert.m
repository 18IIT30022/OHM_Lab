function q=DoInsert(p,i1,i2)
    if i1>i2
        i2=i1;
    end
    
    a=p(1:i1-1);
    b=p(i1+1:i2);
    c=p(i1);
    d=p(i2+1:end);
    
    q=[a b c d];
        
end