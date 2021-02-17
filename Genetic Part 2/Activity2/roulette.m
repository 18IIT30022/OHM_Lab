function out = roulette(population,population_size)
    sum= 0;
    for i = 1:population_size
        
        sum = sum + 1/(population{i,2}+0.1);
    end
    random_number = rand();
    index = 1;
    temp = 0;
    while index<=population_size
        temp = temp+1/(population{index,2}+0.1);
        if temp/sum > random_number
            break;
        end
        index = index+1;
    end
    out = population{index,1};
end