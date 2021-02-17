function [child1,child2] = linear_crossover(parent1,parent2)
    child_array ={};
    child_array{1,1} = 0.6.*parent1+0.8.*parent2;
    child_array{2,1} = 1.2.*parent1-0.86.*parent2;
    child_array{3,1} = -1.2.*parent1+0.5.*parent2;
    child_array{1,2} = obj(child_array{1,1});
    child_array{2,2} = obj(child_array{2,1});
    child_array{3,2} = obj(child_array{3,1});
    child_array = sortrows(child_array,2,'ascend');
    child1 = child_array{1,1};
    child2 = child_array{2,1};
end