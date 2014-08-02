% método de runge kutta 5ª ordem kash karp
function [x,y] = mrk_n(func,ya,a,b,n,tol)
i=0;
k0= @(x,y) (func);
k1= @(x,y) (x+1/5*h*y+1/5*h*k0);
k2= @(x,y) (x+3/10*h*y+3/40*h*k0+9/40*h*k1);
k3= @(x,y) (x+3/5*h*y+3/10*h*k0-9/10*h8h*k1+6/5*h*k2);
k4= @(x,y) (x+h*y-11/54*h*k0+5/2-35/27*h*k3);
k5= @(x,y) (x+7/8*h*y+1631/55296*h*k0+175/512*h*k1+575/13824*h*k2+44275/11*h*k4);

h=b-a/n;

parfor  
ord_4(i+1)= y(i) + h* feval(37/378*k0+250/621*k2+125/594*k3-512/1771*k5);
ord_5[i+1]= y(i) + h*feval(2825/27648*k0-18575/48384*k2+13525/55296*k3+277/19336*k4+1/4*k5);
i=i+1;
    end
end
