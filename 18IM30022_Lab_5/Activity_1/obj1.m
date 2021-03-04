function z = obj(x1,x2)
    M=100;
    t = (1-x1^2)+100*((x1^2 - x2)^2);
    z=M/(t+10);
end