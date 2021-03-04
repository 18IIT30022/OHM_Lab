function f=ofun(x)
%objective function (minimization)
%of=x(1)^2-2*(x(1))-1;
of=10*(x(1)-1)^2+20*(x(2)-2)^2+30*(x(3)-3)^2;
of=of+penalty1(x);    % Penalty Function for first Constraint
of=of+penalty2(x);    % Penalty FUnction for second Constraint
f=of;