W_star=[1;-4;4];
phi=@(x)[x^2;x;1];
jac=@(x)jacobian(phi(x));
%phi=@(x,y,t)[x^2;y^2;x*y;x;y;1];
W_hat=[0;0;0];
f_hat=@(x,t) W_hat'*phi(x);
alpha=1;
W_hat_dot=@(x,t) (-alpha*e(t))*phi(x,t)/(1+phi(x,t)'*phi(x,t))^2;
x_dot=-x+P_k(x-W_hat'*jac(x));
function r=P_k(x)
    mini =0;
    for i=1:10
        if abs(i-x)<abs(mini-x)
            mini=i;
        end
    end
    r=mini;
end