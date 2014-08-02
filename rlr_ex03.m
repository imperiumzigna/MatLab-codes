%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                     %  
%                                                                     %                      
%                         Método Rayleigh Ritz                        %      
%                                                                     %      
%                                                                     %      
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Alunos: Igor Amorim Silva - 12092036 , Claudyane Araújo - 1209207
%
% Descrição: Implementação do Método de Rayleigh Ritz para resolução de Equações
%            Diferenciais de Primeira e Segunda Ordem.
% 
% Obs.: Foram utilizadas apenas 3 iterações de k... 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;
clf;
clc;

disp('\\\\\\\\\\\\\\\\\\\\\\ Método Rayleigh Ritz /////////////////////');
a=1; % Intervalo Inferior
b=2; % Intervalor Superior
n=50;
syms x;
%Condições de Contorno
for i=1:n
phi(i)=x^i-x^(i+1);% função de aproximação para os respectivos valores de k
end


% Equação Diferencial
J=@(y)(diff(y)-2*y*x); % Colocar a E.D
A=[];
% Substituição dos Valores no funcional

JY=J(sum(phi));
%
% Encontranto os valores ak
 A=int(JY,a,b);
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    Y=inline(A*JY);  % A*sum(phi)
   disp('Equação Aproximada');
      disp(Y);
% Plotagem do Gráfico
x=a:0.01:b;
plot(Y(x),'--b');  
hold on, grid on, title('Método de Rayleigh Ritz');
exat=exp(x.^2);
plot(exat,'--r')
legend('Sol. Aproximada','Sol. Exata');

% ERRO
erro= exat-Y(x);
disp('Exata');
disp(exat');
disp('Aproximada');
disp(Y(x)');
disp('Erro');
disp(erro');