%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                               Método de Euler                                          %                                              
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   EULER_FUNCIONANDO 
%
% Utilidade :  função para resolver EDOs com um PVI
%
% Declaração : euler_funcionando(f,a,b,ya,N,exat)
%
% Legenda :
% f - função do tipo f(x,y)
% a - limite inferior 
% b - limite superior
% N - número de pontos para definir o passo
% ya - PVI
% exat - solução exata
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Exemplo
%
% f = @(x,y) y-x^2+1;
% a = 0; b = 2; n = 10; ya = 0.5;
% exata = @(x) (x+1)^2-0.5*exp(x);
%
% euler_funcionando(f,a,b,ya,N,exat)
function  euler_funcionando(f,a,b,ya,N,exat)
clc;clf;
h=(b-a)/N;
x(1)=a;
u(1)=ya;
fprintf('\n\n%%%%%%%%%%%%%%%% Método de Euler %%%%%%%%%%%%%%%%%');
fprintf('\n\nSolução\n');
fprintf('\nX\t\tU\t\tErro\n\n');
for i=2:N+1
    u(i) = u(i-1) + h*f(x(i-1),u(i-1));
    x(i)=a+(i-1)*h;
    s_exata(i) = exat(x(i));
    erro(i)= abs(s_exata(i)-u(i));
end
% Impressão de resultados
fprintf('%.4f\t\t%.4f\t\t%.6f\n',x',u',erro');
hold on, title('Método de Euler'),grid on;
plot(x,u,'--b');plot(x,s_exata,'--r');
legend('Solução Aproximada','Solução Exata'),xlabel('x'),ylabel('u');
end
