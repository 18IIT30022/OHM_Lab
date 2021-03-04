function[pen]=penalty1(x)
    M=1000;
    val=x(1)+x(2)+x(3)-5;
    
    if val<=0
        pen=0;
    else
        pen=val*M;
    end
    
end