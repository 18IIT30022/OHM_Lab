function children=Roulette(Initial_pop,Population_size)
    
    % Applying Roulette Selection
    Cum_sum=0;  %Cumulative sum
    Cum_Fit=zeros(Population_size,1);
    mx=0;
    Pop_Sum=zeros(10,1);
    for i=1:Population_size
        z=obj1(bin2dec(Initial_pop(i,1)),bin2dec(Initial_pop(i,2)));
        z=z-penalty1(bin2dec(Initial_pop(i,1)),bin2dec(Initial_pop(i,2))); % Penalty1 Function for 1st constraint
        z=z-penalty2(bin2dec(Initial_pop(i,1)),bin2dec(Initial_pop(i,2))); % Penalty1 Function for 2nd constraint
        mx=max(mx,z);
        z;
        %Cum_sum
        Cum_sum=Cum_sum + z;
        Cum_Fit(i)=Cum_sum;
        Pop_Sum(i)=z;
    end
    
    Generate=strings();
    
    
    
    %Dividing cumulative values
    for j=1:Population_size
        Cum_Fit(j)=Cum_Fit(j)/Cum_sum;    
    end
    Cum_Fit;
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
    
    children=Generate;
    
end