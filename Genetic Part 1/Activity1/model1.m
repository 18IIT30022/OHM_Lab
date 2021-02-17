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

Initial_pop=strings(Population_size,1);

%Initial Population using Binary Encoding
for it=1:Population_size
    temp=randsample(u_bound,1);
    temp=dec2bin(temp);
    Initial_pop(it)=temp;
end

Cum_sum=0;
mx=0;

% Calculating Cumulative Sum, Population sum and Cumulative Fitness values for generating
% new population
Pop_Sum=zeros(10,1);
for i=1:Population_size
    x=bin2dec(Initial_pop(i));
    z=obj1(x);
    mx=max(mx,z);
    z;
    Cum_sum=Cum_sum + z;
    Pop_Sum(i)=z;
end
Cum_sum=Cum_sum /10;
Generate=strings();
index=1;

%Generating parents for next Iteration using Proportionate Selection
for j=1:Population_size
    Pop_Sum(j)= round(Pop_Sum(j)/Cum_sum,0);
    Pop_Sum(j);
    if Pop_Sum(j)>0
        for k=1:Pop_Sum(j);
            Generate(index)=Initial_pop(j);
            index=index+1;
        end
    end
end
% Printing Required values
disp('Fitness Values of Initial Population')
Pop_Sum

disp('Maximum Fitness Value')
mx

disp('Generated New Population')
Generate
