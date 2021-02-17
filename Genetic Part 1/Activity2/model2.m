clc;
clear;
close all;
%Name Suman Kumar
%Roll-18IM30022
%Initializing lower bounds, upper bounds of variables and the Population
%size
Population_size=10;
l_x1=-5;
r_x1=5;
l_x2=-5;
r_x2=5;

%Initial Population
Initial_pop=zeros(10,2);


%Generating Initial Solutions
for it=1:Population_size
    temp1=l_x1+rand()*(r_x1-l_x1);
    temp2=l_x2+rand()*(r_x2-l_x2);
    Initial_pop(it,1)=temp1;
    Initial_pop(it,2)=temp2;
end

% Calculating Cumulative Sum, Population sum and Cumulative Fitness values for generating
% new population
Cum_sum=0;  %Cumulative sum
Cum_Fit=zeros(Population_size,1);
mx=0;
Pop_Sum=zeros(10,1);
for i=1:Population_size
    z=obj2(Initial_pop(i,1),Initial_pop(i,2));
    mx=max(mx,z);
    z;
    %Cum_sum
    Cum_sum=Cum_sum + z;
    Cum_Fit(i)=Cum_sum;
    Pop_Sum(i)=z;
end
Cum_sum;
Generate=[];


%Dividing cumulative values
for j=1:Population_size
    Cum_Fit(j)=Cum_Fit(j)/Cum_sum;    
end

%Doing Roulette Wheel Selection
for j=1:Population_size
    comp=rand();
    bool=0;
    for k=2:Population_size
        if(comp>Cum_Fit(k-1) & comp<=Cum_Fit(k))
            Generate(j,1)=Initial_pop(k,1);
            Generate(j,2)=Initial_pop(k,2);
            bool=1;
            break
        end
    end
    if(bool==0)
        Generate(j,1)=Initial_pop(1,1);
        Generate(j,2)=Initial_pop(1,2);
    end
    
end
% Printing Required Values

disp('Fitness Values of Initial Population')
Pop_Sum

disp('Maximum Fitness Value')
mx

disp('Generated New Population(x1,x2)')
Generate