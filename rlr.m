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
a=input('Intervalo Inferior:'); % Intervalo Inferior
b=input('Intervalor Superior:'); % Intervalor Superior
n=input('Número de iterações:');
syms x;
%Condições de Contorno
cc(1,1)=a;
cc(2,1)=b;
cc(1,2)=input('Condição de Contorno [1]:');
cc(2,2)=input('Condição de Contorno [2]:');
for i=1:n
phi(i)=input('Função de Aproximação:');% função de aproximação para os respectivos valores de k
end


% Equação Diferencial
J=@(y)(input('E.D.:'));% Colocar a E.D
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
x=0:0.1:1;
plot(Y(x),'--b');  
hold on, grid on, title('Método de Rayleigh Ritz');
exat=input('Solução Exata:');
plot(exat,'-og')
legend('Sol. Aproximada','Sol. Exata');

% ERRO
erro= exat-Y(x);
disp('Erro');
disp(erro);