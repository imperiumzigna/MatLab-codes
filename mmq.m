function [UaproxGra, pontos] = mmq( coef, P, a, b )

syms x; clc;

%Calcular o número n de coeficientes de u
n = 0;
for i = 1:length(coef)
    if coef(i) ~= 0;
        n = n + 1;
    end
end

%Calculo da função da solução aproximada u(i) = alpha(i) * phi(i)
%Phi = {(x - x^2), (x^2 - x^3), (x^3 - x^4), ...}
%-----------------------------------------------------------------
for i = 1:n
    u(i) = (x^(i) - x^(i+1));
end

                       %Derivadas
%--------------------------------------------------------
du=diff(u); %Derivada primeira de u
d2u=diff(du); %Derivada segunda de u

%Psi = L(phi)
%--------------------------------------------------------
for i = 1:n
    psi(i)=coef(1)*d2u(i) + coef(2)*du(i) + coef(3)*u(i);
end

%Função Residual --> E = lu - P
%--------------------------------------------------------
for i = 1:n
    for j = 1:n
        %Calculo da função Lu
        Lu = coef(1)*d2u(j) + coef(2)*du(j) + coef(3)*u(j);
        %Integral o residual*psi no dominio (a,b) forçado a 0
        A(i,j) = int(Lu*psi(i),x,a,b);
    end
    %Matriz dos termos independentes
    B(i) = -int(psi(i)*P, x, a, b);
end

%Valores dos Alphas
disp('Alphas:')
Alphas = A\B'

%ua - Solução Aproximada

disp('Solução Aproximada:')
ua = 0;
for i=1:n
ua = ua + Alphas(i) * u(i);
end
ua

%Função Aproximada nos pontos escolhidos
pontos = a:0.01:b;
UaproxGra = 0;

for i = 1:n
    UaproxGra = UaproxGra + (Alphas(i)*pontos.^(i) - Alphas(i)*pontos.^(i+1));
end

end

