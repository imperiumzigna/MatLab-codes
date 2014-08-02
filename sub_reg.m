function [ UaproxGra,pontos ] = sub_reg(coef, P, a, b)

syms x; clc;

%Calcular o número n de coeficientes de u
n = 2;


%Dividir o dominio (a,b) em sub-regiões

sub = (a+b)/2;

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

%Função Residual --> E = lu - P
%--------------------------------------------------------
    for j = 1:n
        %Calculo de Lu
        Lu = coef(1)*d2u(j) + coef(2)*du(j) + coef(3)*u(j);
        A(1,j) = int(Lu,x,a,sub);
    end
    for j = 1:n
        %Calculo de Lu
        Lu = coef(1)*d2u(j) + coef(2)*du(j) + coef(3)*u(j);
        A(2,j) = int(Lu,x,sub,b);
    end
    %Matriz dos termos independentes
    
    A
        B(1) = -int(P, x, a, sub);
        B(2) = -int(P, x, sub, b);
    B
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

