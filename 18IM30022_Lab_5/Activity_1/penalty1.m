function[pen]=penalty1(x1,x2)
    M=100;
    val=x1*x2+x1-x2+1.5;
    
    if val<=0
        pen=0;
    else
        pen=val*M;
    end
    
end
