%************************************************%
%OHM IM 39003
%Particle Swarm Optimization: In-Class March 5, 2020
%Author: Suman Kumar, 18IM30022

%************************************************%

clc
clear all
close all
rng default %control for randome number generator
tic %Stopwatch timer

%%Function Bounds
m=3; % no vars
LB=[0 0 0];
UB=[10 10 10];

% Best Parameters taken after the Analysis of Activity 1 for this part
%%PSO Parsms
n=50;          % population size
w= 0.1          % inertia weight
wdamp = 0.99    % inertia deamping
c1=0.6;           % acceleration factor P_best
c2=1;           % acceleration factor G_best
maxite=50;      % set maximum number of iteration in each run
maxrun=10;       % set maximum number of runs need to be

%%PSO loop
for run=1:maxrun
    run
    % pso initialization----------------------------------------------start
    for i=1:n
        for j=1:m
            x0(i,j)=round(LB(j)+rand()*(UB(j)-LB(j)));
        end
    end
    x=x0;     % initial population
    v=0.1*x0; % initial velocity
    for i=1:n
        f0(i,1)=ofun(x0(i,:));
    end
    [fmin0,index0]=min(f0);
    pbest=x0;           % initial pbest
    gbest=x0(index0,:); % initial gbest
    % pso initialization------------------------------------------------end
    % pso algorithm---------------------------------------------------start
    ite=1;
    while ite<=maxite 
        w=w*wdamp       %updating inertia weight
        % pso velocity updates
        for i=1:n
            for j=1:m
                v(i,j)=w*v(i,j)+c1*rand()*(pbest(i,j)-x(i,j))...
                    +c2*rand()*(gbest(1,j)-x(i,j));
            end
        end
        % pso position update
        for i=1:n
            for j=1:m
                x(i,j)=x(i,j)+v(i,j);
            end
        end
        % handling boundary violations
        for i=1:n
            for j=1:m
                if x(i,j)<LB(j)
                    x(i,j)=LB(j);
                elseif x(i,j)>UB(j)
                    x(i,j)=UB(j);
                end
            end
        end
        % evaluating fitness
        for i=1:n
            f(i,1)=ofun(x(i,:));
        end
        % updating pbest and fitness
        for i=1:n
            if f(i,1)<f0(i,1)
                pbest(i,:)=x(i,:);
                f0(i,1)=f(i,1);
            end
        end
        [fmin,index]=min(f0); % finding out the best particle
        ffmin(ite,run)=fmin;  % storing best fitness
        ffite(run)=ite;       % storing iteration count
        
        % updating gbest and best fitness
        if fmin<fmin0
            gbest=pbest(index,:);
            fmin0=fmin;
        end
        
        %displaying iterative results
        if ite==1
            disp(sprintf('Iteration Best particle Objective fun'));
        end
        disp(sprintf('%8g %8g %8.4f',ite,index,fmin0));
        ite=ite+1;
        
    end
    % pso algorithm-----------------------------------------------------end
    gbest;
    fvalue=ofun(gbest);
    %fvalue=10*(gbest(1)-1)^2+20*(gbest(2)-2)^2+30*(gbest(3)-3)^2;
    fff(run)=fvalue;
    rgbest(run,:)=gbest;
    disp(sprintf('--------------------------------------'));
end
% pso main program------------------------------------------------------end
disp(sprintf('\n'));
disp(sprintf('*********************************************************'));
disp(sprintf('Final Results-----------------------------'));
[bestfun,bestrun]=min(fff)
best_variables=rgbest(bestrun,:)
disp(sprintf('*********************************************************'));
toc
% PSO convergence characteristic
plot(ffmin(1:ffite(bestrun),bestrun),'-k');
xlabel('Iteration');
ylabel('Fitness function value');
title('PSO convergence characteristic')


