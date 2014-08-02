clf
clear
clc;
syms x;
a=0;
b=3;
n =2;

coef=[1 2 ];
v_ord=[2 0 ];

k=x;
%Calcular o número n de coeficientes de u

%Dividir o dominio (a,b) em sub-regiões
div_sdm=2;
if div_sdm >1
sub_dm = (a+b)/div_sdm;
else
    dis('Número de Subdivisões insuficiente...');
    break;
end
for i = 1:n
    % Caso utilizar sem o input, usar i colocar na forma Ex.: x.^i-x.^(i+1)
    % Algumas vezes o matlab pode acusar erro, caso apareça erro na linha
    % u(i)= .... usar :  u(i)=vpa(função de aproximação);
    % se o erro persistir, tente u{i}=x.^{i}-x.^({i}+1), caso ainda não
    % resolva o problema, se vire.
     u(i) =x.^i- x.^(i+1); 
    
end

for j = 1:n
        % Encontrando as matrizes das integrais nos subdomínios
        dfu = sum(coef(j)*diff(u(j),v_ord(j)));
        M1(1,j) = int(dfu,x,a,sub_dm);
        M1(2,j) = int(dfu,x,sub_dm,b);
    end
   
    M1
        M2(1) = -int(k, x, a, sub_dm);
        M2(2) = -int(k, x, sub_dm, b);
    M2
%Valores coeficientes ak (da solução aproximada)
disp('Coeficientes da Solução Aproximada:')
ak = M1\M2'

sol_aprox = 0;
for i=1:n
sol_aprox = sol_aprox + ak(i) * u(i);
end

disp('Solução Aproximada');
disp(sol_aprox);
% Gráfico
x = a:0.01:b;
plot(subs(sol_aprox),'--b');
hold on, title('Método das SubRegiões');

exat=sin(sqrt(2*x))+cos(sqrt(2*x))+x/2;

plot(exat,'--r');legend('Sol. Aproximada','Sol. Exata');

erro=subs(sol_aprox)-exat;
disp('Erro');
disp(erro');

    


