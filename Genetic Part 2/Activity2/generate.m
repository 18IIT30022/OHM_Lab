function out = generate(population_size,lb,ub,no_of_variables)
    out={};
    for i=1:population_size
        z = lb+(ub-lb).*rand(1,no_of_variables);
        out{i,1} = z;
        out{i,2} = obj(z);
    end
end