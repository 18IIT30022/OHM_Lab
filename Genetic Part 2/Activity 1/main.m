clc;
clear;
close all;
%Name Suman Kumar
%Roll-18IM30022
%Initializing lower bounds, upper bounds of variables and the Population
%size
Population_size=10;
l_bound=0;
u_bound=31;
cross_prob=0.7;
mut_prob=0.02;


Initial_pop=strings(Population_size,1);

%Initial Population using Binary Encoding
for it=1:Population_size
    temp=randsample(u_bound,1);
    temp=dec2bin(temp,5);
    Initial_pop(it)=temp;
end

for it=1:50
    Iteration_Number= it
    Generate= Roulette(Initial_pop,Population_size);
    Child=CrossAndMut1(Generate,Population_size,cross_prob,mut_prob);
    Generate
    Child
end

Final_Solution=Child

z=0;
ans=0;
for i=1:10
    temp=Final_Solution(i);
    temp=bin2dec(temp);
    if(obj1(temp)>z)
        z=obj1(temp);
        ans=temp;
    end
    z=max(z,obj1(temp));
end

Best_Solution_Global=ans
Optimal_valueofObjectiveFunction=z
% Printing Required values
