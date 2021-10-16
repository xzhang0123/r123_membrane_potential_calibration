function Dfi=r2fi(data)
    for j=1:1:length(data)
        I=data(j);
        x0 = [3.824,160];  %initial value
        
        A = []; b = [];
        Aeq = [];   beq = [];
        lb=[1e-3 0];    ub=[1e2 250];
        x = fmincon(@(x)r123_fun(x,I),x0,A,b,Aeq,beq,lb,ub);
        fi(j)=x(2);
    end
Dfi=fi;