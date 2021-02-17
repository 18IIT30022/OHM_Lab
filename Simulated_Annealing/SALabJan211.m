clear
clc
%Lower and upper bounds
Lb = [-5 -5];
Ub = [5 5]
u0 = [0,-5] %Initial solution
d = length(Lb) %size of solution 
%SA Parameters
T_init = 1000; %Initial Temperature 
max_run = 1000; %Maximum Number of runs 
k = 1 %Boltzman constant
T_min = 0.1; %Minimum temperature for cooling
alpha= 0.90; %cooling factor
max_rej=1000;
max_accept=40;
initial_search=1000;
%Initializing Counters and values
i = 0; j = 0; accept=0; totaleval = 0; 
T = T_init;
E_init = Fun(u0); 
E_old = E_init; 
E_new= E_old;
best = u0;
%Main Program 
while (T>T_min & j<=max_rej)
    i=i+1;
    if(i>=max_run | accept>=max_accept)
        %reset counters
        i=1;
        accept=0;
        %cooling according to cooling schedule
        T=cooling(alpha,T);
    end
    if(totaleval<initial_search)
        ns=newsolution1(u0,Lb,Ub);
    else
        ns= best+rand(size(u0))*400-0.5;
        ns= bounds (ns, Lb, Ub); 
    end
    totaleval = totaleval+1;
    E_new=Fun(ns);
    DeltaE=E_new-E_old;
    if(DeltaE<0)
        best=ns;
        E_old = E_new;
        accept=accept+1;
    end
    if (DeltaE>=0 & exp(-DeltaE/(k*T))>rand)
        best = ns;
        E_old = E_new;
        accept=accept+1;
    else
        j=j+1;
    end
    f_opt=E_old;
    
end
bestsol=best
f_val=f_opt
N=totaleval