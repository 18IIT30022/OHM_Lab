function[pen]=penalty2(x1,x2)
    M=100;
    val=10-x1*x2;
    
    if val<=0
        pen=0;
    else
        pen=val*M;
    end
    
end