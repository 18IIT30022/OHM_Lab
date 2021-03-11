%************************************************%
%OHM 39003
%ACO Algorithm: In-Class March 12, 2020
%Author: Suman Kumar, 18IM30022
%************************************************%

clc;
clear;
close all;

due = [18 6 9 11 8];
process = [6 2 3 4 5];
n=length(due);
D=zeros(n,n);

for i = 1:n
    for j = 1:n
        D(i,j) = due(j);
    end
end

    
nVar=n;
Sequence = [];


%% ACO Parameters

MaxIt=300;      % Maximum Number of Iterations

nAnt=100;       % Number of Ants (Population Size)

tau0=100;       % Initial Pheromone

alpha=1;        % Phromone Exponential Weight
beta=1;         % Heuristic Exponential Weight

rho=0;          % Evaporation Rate

%% Initialization
eta=1./D;                   % Heuristic Information Matrix

tau=tau0*ones(nVar,nVar);   % Pheromone Matrix
BestCost=zeros(MaxIt,1);    % Array for storing Global Best Value

% Empty Ant
empty_ant.sequence=[];
empty_ant.Cost=[];

% Ant Colony Matrix
ant=repmat(empty_ant,nAnt,1);

% Best Ant
BestSol.Cost=inf;


%% ACO Main Loop

for it=1:MaxIt
    Cum_Tard = [];
    % Move Ants
    for k=1:nAnt
        
        ant(k).Sequence=randi([1 nVar]);
        
        for l=2:nVar
            
            i=ant(k).Sequence(end);
            
            P=tau(i,:).^alpha.*eta(i,:).^beta;
            
            P(ant(k).Sequence)=0; %replace Inf by 0
            
            P=P/sum(P);
            
%% RouletteWheelSelection;
            r=rand;
    
            C=cumsum(P);
    
            j=find(r<=C,1,'first');
            
            ant(k).Sequence=[ant(k).Sequence j];
            
        end  
        Tard = [];
        cumulative = 0;
        for node = ant(k).Sequence
            cumulative = cumulative + process(node);
            Tard = [Tard max(cumulative-due(node), 0)];
        end

        Cum_Tard = [Cum_Tard sum(Tard)];
        Y = 100/Cum_Tard(end);
    end
    
    %% Update Pheromones
    for k=1:nAnt
        
        Sequence=ant(k).Sequence;
        n=numel(Sequence);
        
        L=Cum_Tard(k);
	    ant(k).Cost = L;

        for l=1:nVar-1
            
            i=Sequence(l);
            j=Sequence(l+1);
            
            tau(i,j)=tau(i,j)+Y;
            
        end
         if ant(k).Cost<BestSol.Cost
            BestSol=ant(k);
        end
        
    end
    
    % Evaporation
    tau=(1-rho)*tau;
    
    % Store Best Cost
    BestCost(it)=BestSol.Cost;
    
    % Show Iteration Information
    disp(['Iteration ' num2str(it) ': Best Cost = ' num2str(BestCost(it))]);
    if it==MaxIt
        BestSol
    end
       
end

%% Results

figure;
plot(BestCost,'LineWidth',2);
xlabel('Iteration');
ylabel('Best Cost');
grid on;