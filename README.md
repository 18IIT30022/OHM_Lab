# OHM_Lab
OHM_Lab

1.Simulated Annealing

Activity 1: z = 500-20*x1-26*x2-4*x1*x2+4*x1^2+3*x2^2; -2≤x1≤10; -1≤x2≤11

Activity 1.1: Understanding the attached code [We will do during the lab session]
Activity 1.2: Code provided to you is jumbled up and some counters are not updated you need to update the counters and make the flow of the code correct so that it produces results. 
Activity 1.3: You need to run the code for different parameters values and understand the effect of the parameters: 
⦁	Starting solution 
⦁	Starting temperature 
⦁	Maximum runs 
⦁	Cooling factor 
Activity 2:  z = (1-x1)^2+100*(x2-x1^2)^2; -5≤x1≤5; -5≤x2≤5

Activity 2.1: You need to add following piece of codes in the code provided to you: [Code submission required]
⦁	Introduce three parameters: 
max_rej = ;            %Maximum Number of Rejections
max_accept = ;        %Maximum Number of accepts at a temperature 
initial_search= ;    %Initial search period 

⦁	Stopping criteria for main program: T>T_min and j> max_rej
⦁	Criteria for changing cooling schedule either (i>=max_run) or (accept>=max_accept)
⦁	If total evaluation is less than initial_search then search around (as already given in the code). But, if total evaluation is greater than initial search do a local search that means around the point using some step size and generate a random number.  

Activity 2.2: Find the optimal solution. While finding the optimal solution, you can report how following parameter affected you search. [Submission required in report format]
⦁	Starting solution 
⦁	Starting temperature 
⦁	Maximum runs 
⦁	Cooling factor 
⦁	max_accept
⦁	step size for local search 
