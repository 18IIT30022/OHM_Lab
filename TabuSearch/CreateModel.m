

function model=CreateModel()

    %x=[82 91 12 92 63 9 28 55 96 97 15 98 96 49 80 12 80 55];
    
    %y=[14 42 92 80 96 66 3 85 94 68 76 75 39 66 17 78 80 45];
    
    %n=numel(x);
    
    
    %d=zeros(n,n);
    n=5;
    d=[0 132 217 164 158;132 0 290 201 79;217 290 0 113 303; 164 201 113 0 196;158 79 303 196 0]
    xmin=0;
    xmax=100;
    
    ymin=0;
    ymax=100;
    
    model.n=n;
    %model.x=x;
    %model.y=y;
    model.d=d;
    %model.xmin=xmin;
    %model.xmax=xmax;
    %model.ymin=ymin;
    %model.ymax=ymax;
    
end