function z = obj2(x,y)
k=(1-x).^2+100*(y-x.^2).^2;
z=5/(0.001+k);
