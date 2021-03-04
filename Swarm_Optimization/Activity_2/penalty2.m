function[pen]=penalty2(x)
    M=1000;
    val=x(1)*x(1)+2*x(2)-x(3);
    
    if val<=0
        pen=0;
    else
        pen=val*M;
    end
    
end