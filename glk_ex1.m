% ODEGALERKIN Ordinary Differential Equation Solver through Galerkin
% Method.
% [APPROX,EXAC,ERR] = ODEGALERKIN(POLY,BC,N) solves Ordinary Differential 
% Equations (ODE) through Galerkin method, by inserting the characteristic 
% polynomial matrix "POLY", boundary conditions "BC" and the finite 
% quantity of approximative base functions "N".
%
% Outputs of the program are the approximative solution "APPROX", the
% analitic solution "EXAC" and the percentage error "ERR" (%).
%
% NOTE: IF BOUNDARY CONDITIONS ARE EXPRESSED IN TERMS OF DERIVATIVES, THE
% "BC" MATRIX MUST BE OF SIZE 2X2 INSTEAD OF 1X4, SIMPLY BY PUTTING ";"
% BETWEEN THE SECOND AND THIRD ELEMENT.
%
% 
% EXAMPLE 1:
% Find an approximative solution to the following ODE. Use 17 base
% functions:
% 
% 1*y''(x)+2*y'(x)-3*y(x)=6      y(2)=4     y(0)=-7
%
% ======Start Command Window======
% syms x;
% [approx]=odegalerkin([1 2 -3 6],[2 4 0 -7],17)
% ======End Command Window======
%
% EXAMPLE 2:
% Find an approximative solution to the following ODE. Use 25 base
% functions. Also calculate the exact solution.
%
% 1*y''(x)+0*y'(x)+3*y(x)=x^2+2       y(2)=4     y(0)=7
%
% ======Start Command Window======
% syms x;
% [approx,exac]=odegalerkin([1 0 3 x^2+2],[2 4 0 7],25)
% ======End Command Window======
%
% EXAMPLE 3:
% Find an approximative solution to the following ODE. Use 4 base
% functions. Also calculate the exact solution and the percentage error.
%
% y''(x)+4*y'(x)+3*x*y(x)=8*sin(x)      y(2)=0     y'(5)=-2
%
% ======Start Command Window======
% syms x;
% [approx,exac,erro]=glk_ex1([1 1 4 x^2+2],[2 4 0 7],25)
% ======End Command Window======

function [approx,exac,err]=glk_ex1(poly,bc,n)

syms x;
a2=poly(1);
a1=poly(2);
a0=poly(3);
g=poly(4);
if length(bc)==4
    x1=bc(1);
    phi1=bc(2);
    x2=bc(3);
    phi2=bc(4);
    phi=(phi2-phi1)/(x2-x1)*(x-x1)+phi1;   
elseif length(bc)==2
    bc=bc';
    x1=bc(1);
    phi1=bc(2);
    x2=bc(3);
    phiprima2=bc(4);
    phi=phiprima2*x+(phi1-phiprima2*x1);
    phi2=phiprima2*x2+(phi1-phiprima2*x1);
else error('The size of the boundary conditions matrix is not valid.')
end

phider1=diff(phi);
phider2=diff(diff(phi));
if lt(x1,x2)
    x_inf=x1;
    x_sup=x2;
    y_inf=phi1;
    y_sup=phi2;
else
    x_inf=x2;
    x_sup=x1;
    y_inf=phi2;
    y_sup=phi1;
end
for i=1:n, 
    psi(1,i)=x^(i-1); 
end
if length(bc)==4
    psi=(x-x1)*(x-x2)*psi;
elseif length(bc)==2
    psi=(x-x1)*((x-x2)^2).*psi;
else error('The size of the boundary conditions matrix is not valid.')
end
psider1=diff(psi);
psider2=diff(diff(psi));
psitrans=transpose(psi);
E1=a2*psider2+a1*psider1+a0*psi;
E2=a2*phider2+a1*phider1+a0*phi-g;
c=-(int(psitrans*E1,x,x1,x2))\int(psitrans*E2,x,x1,x2);
e=E1*c+E2;

approx=phi+psi*c;
x=(x_inf-10):.2:(x_sup+10);
y_approx=subs(approx);

clear x;
syms x;
if length(bc)==4
    exac=dsolve('a2*D2y+a1*Dy+a0*y=g','y(x1)=phi1','y(x2)=phi2','x');
elseif length(bc)==2
    exac=dsolve('a2*D2y+a1*Dy+a0*y=g','y(x1)=phi1','Dy(x2)=phiprima2','x');
else error('O tamanho da matriz com as condições de contorno não é exato')
end
exac=subs(exac);
x=(x_inf-10):.2:(x_sup+10);
y_exac=subs(exac);
disp('Solução Exata');
disp(y_exac');
e_norm2=sqrt(int(e^2,x1,x2));
f_norm2=sqrt(int(approx^2,x1,x2));
err=y_exac-y_approx;
disp('Erro');
disp(err');
plot(x,y_approx,'-or'),grid
axis([x_inf-pi x_sup+pi -100 100])
hold on;
title('Método de Galerkin');
plot(x,y_exac,'--b'),grid on;
legend('Solução Aproximada','Solução Exata')
hold off
grid on