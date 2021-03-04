clc;
clear;
close all;
%Name Suman Kumar
%Roll-18IM30022
%Initializing lower bounds, upper bounds of variables and the Population
%size
Population_size=10;
l_bound=0;
u_bound=15;
cross_prob=0.7;
mut_prob=0.02;


Initial_pop=strings(Population_size,2);

%Initial Population using Binary Encoding

for it=1:Population_size
    temp1=randsample(u_bound,1);
    temp1=dec2bin(temp1,5);
    temp2=randsample(u_bound,1);
    temp2=dec2bin(temp2,5);
    Initial_pop(it,1)=temp1;
    Initial_pop(it,2)=temp2;
end

% Doing Roulette Selection and Crossover Mutation
for it=1:50
    Iteration_Number= it
    Generate= Roulette(Initial_pop,Population_size);
    Child=CrossAndMut1(Generate,Population_size,cross_prob,mut_prob);
    Generate
    Child
end

% Finding best global solution solution among all the solutions
Final_Solution=Child

z=0;
ans=[];
for i=1:10
    temp1=Final_Solution(i,1);
    temp1=bin2dec(temp1);
    
    temp2=Final_Solution(i,2);
    temp2=bin2dec(temp2);
    if(obj1(temp1,temp2)>z)
        z=obj1(temp1,temp2);
        ans(1,1)=temp1;
        ans(1,2)=temp2;
    end
    z=max(z,obj1(temp1,temp2));
end

Best_Solution_Global=ans
Optimal_valueofObjectiveFunction=(1-ans(1,1)^2)+100*((ans(1,1)^2-ans(1,2))^2)
% Printing Required values
