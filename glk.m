% Método de Galerkin
% coef = vetor com os coeficientes da E.D
% cc = matriz com as condições de contorno
% n= número de iterações
function [aprox,exat,err]=glk(coef,cc,n)
syms x;
a2=coef(1);
a1=coef(2);
a0=coef(3);
g=coef(4); % Termos independentes

if length(cc)==4
    x1=cc(1);
    phi1=cc(2);
    x2=cc(3);
    phi2=cc(4);
    phi=(phi2-phi1)/(x2-x1)*(x-x1)+phi1;   
elseif length(cc)==2
    cc=cc';
    x1=cc(1);
    phi1=cc(2);
    x2=cc(3);
    t_phi_cc=cc(4);
    phi=t_phi_cc*x+(phi1-t_phi_cc*x1);
    phi2=t_phi_cc*x2+(phi1-t_phi_cc*x1);
end
% Derivadas de phi
dphi=diff(phi);
d2phi=diff(phi,2);

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
    psi(i)=x^(i-1); % Função Residual
end
if length(cc)==4
    psi=(x-x1)*(x-x2)*psi;
elseif length(cc)==2
    psi=(x-x1)*((x-x2)^2).*psi;
end
% Derivadas da função Residual
dpsi=diff(psi);
d2psi=diff(psi,2);

psitrans=transpose(psi);
E1=a2*d2psi+a1*dpsi+a0*psi;
E2=a2*d2phi+a1*dphi+a0*phi-g;
% Integral do Resíduo E1 / E2
c=-(int(psitrans*E1,x,x1,x2))\int(psitrans*E2,x,x1,x2);
e=E1*c+E2;

aprox=phi+psi*c;
x=(x_inf-10):.2:(x_sup+10);
y_approx=subs(aprox);

clear x;
syms x;
if length(cc)==4
    exat=dsolve('a2*D2y+a1*Dy+a0*y=g','y(x1)=phi1','y(x2)=phi2','x');
elseif length(cc)==2
    exat=dsolve('a2*D2y+a1*Dy+a0*y=g','y(x1)=phi1','Dy(x2)=phiprima2','x');
end
exat=subs(exat);
x=(x_inf-10):.2:(x_sup+10);
y_exac=subs(exat);
disp('Solução Exata');
disp(y_exac');

% Erro Absoluto
err=y_exac-y_approx;
disp('Erro');
disp(err');
% Plotagem dos Gráficos
plot(x,y_approx,'-or'),grid
axis([x_inf-pi x_sup+pi -100 100]);
hold on;
title('Método de Galerkin');
plot(x,y_exac,'--b'),grid on;
legend('Solução Aproximada','Solução Exata')
hold off;
grid on;