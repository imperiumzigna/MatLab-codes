%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                     %  
%                                                                     %                      
%                         Métodos : -> Método dos Subdomínios         %      
%                                   -> Método da Colocação            %      
%                                   -> Método dos Mínimos Quadrados   %
%                                   -> Método de Galerkin             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Alunos: Igor Amorim Silva - 12092036 , Claudyane Araújo - 1209207
%
% Descrição: Implementação dos Métodos citados para resolução de Equações
%            Diferenciais do tipo Dy/Dx = --- com coeficientes "conhecidos".
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc;
clf;
% Variables
q = 1.0;               % Distribuição dos Pontos
n = 100;                            % Número de Pontos
                                    
				    
% Parâmetros

% Chute de alguns valores para serem os coeficientes                                    
c1 = 1.0/(2.0*pi^3.0);              % Coeficiente para o Método do Subdomínio
c2 = 2.0/(pi^3.5);                  % Coeficiente para o Método da Colocação
c3 = 4.0/(pi^5.0);                  % Coeficiente para o Método dos Mínimos Quadrados
c4 = 4.0/(pi^5.0);                  % Coeficiente para o Método de Galerkin


%-----------------------------------------------------------------

% Cálculo das curvas
for i=1:1:n
  x(i) = (i-1)/(n-1); % Vetor Igualmente Espaçado
  exata(i) = exp(2.*x(i));   % Solução Exata
  %
  w = 2*x(i);                             % E.D. do tipo Dy/Dx = sin(pi*x(i))
  w1(i) = c1*w;                                % Método dos Sub-Regiões
  w2(i) = c2*w;                                % Método da Colocação
  w3(i) = c3*w;                                % Método dos Mínimos Quadrados
  w4(i) = c4*w;                                % Método de Galerkin
end

%-----------------------------------------------------------------
% Gráfico
hold on;
figure(1);title('Métodos'),grid on;
plot(x,exata,'b',x,w1,'--r');
legend('Solução Exata','Método dos Subdomínios');
