clear
clc
%Lower and upper bounds
Lb = [-2 -1];
Ub = [10 11]
u0 = (Lb+Ub)/2 %Initial solution
d = length(Lb) %size of solution 
%SA Parameters
T_init = 1000; %Initial Temperature 
max_run = 100; %Maximum Number of runs 
k = 1 %Boltzman constant
T_min = 0.1; %Minimum temperature for cooling
alpha= 0.3; %cooling factor
%Initializing Counters and values
i = 0; j = 0; totaleval = 0; 
T = T_init;
E_init = Fun(u0); 
E_old = E_init; 
E_new= E_old;
best = u0;
%Main Program 
while (T>T_min)
    i=i+1
    if(i>=max_run)
        %reset counters
        i=1;
        %cooling according to cooling schedule
        T=cooling(alpha,T);
    end
    ns=newsolution1(u0,Lb,Ub);
    totaleval = totaleval+1;
    E_new=Fun(ns);
    DeltaE=E_new-E_old;
    if(DeltaE<0)
        best=ns;
        E_old = E_new;
        j=0;
    end
    if (DeltaE>=0 & exp(-DeltaE/(k*T))>rand)
        best = ns;
        E_old = E_new;
    end
    f_opt=E_old;
    
end
bestsol=best;
f_val=f_opt;
N=totaleval;