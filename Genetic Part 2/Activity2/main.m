clc
clear
% Name- Suman- Kumar
% Roll- 18IM30022
%%%%%% Initial Parameters for Problem %%%%%%
population_size = 10;
lb = [-5 -5];
ub = [5 5];
no_of_variables = 2;
Prob_crossover = 0.7;
Prob_mutation = 0.02;
maximum_it = 50;


population = generate(population_size,lb,ub,no_of_variables);
best_fitness_array = [];
best_solution = -1;
best_solution_value = +10000000;

for i=1:maximum_it
    best_fit_indi = population{1,1};
    best_fit_value = population{1,2};
    for j= 2:population_size
        if best_fit_value > population{j,2}
            best_fit_value = population{j,2};
            best_fit_indi = population{j,1};
        end
    end
    if best_solution_value > best_fit_value
        best_solution_value = best_fit_value;
        best_solution = best_fit_indi;
    end
    best_fitness_array = [best_fitness_array; best_solution_value];
    
    % Doing Roulette Wheel Selection
    st_pool = {};
    for j=1:population_size
        st_pool{j,1} =roulette(population,population_size);
    end
    
    % Doing Linear Crossover
    for j=1:2:population_size
        if rand() <= Prob_crossover
            random_indexes = randi(population_size,2,1);
            index1 = random_indexes(1);
            index2 = random_indexes(2);
            [child1 child2]= linear_crossover(st_pool{index1,1},st_pool{index2,1});
            st_pool{index1,1} = child1;
            st_pool{index2,1} = child2;
        end
    end
    
    % Doing Mutation
    for j=1:population_size
        if rand() <= Prob_mutation
            parent=st_pool{j,1};
            mutated_indi = parent(2:-1:1);
            st_pool{j,1} = mutated_indi;
        end
    end
    
    %adding value of fitness
    for j=1:population_size
        st_pool{j,2} = obj(st_pool{j,1});
    end
    population = st_pool;
end

best_solution
best_solution_value