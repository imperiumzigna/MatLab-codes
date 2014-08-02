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
%            Diferenciais do tipo Dy/Dx = --- com coeficientes conhecidos.
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc;
clf;
% Variables
tam = input('Tamanho:'); %1.0;                            % length of the beam
                           % (bending) stiffness
q = input('Distribuição dos Pontos:');%1.0;                            % Distribuição dos Pontos

n = input('Número de Pontos:');% 100;                            % number of sample points
                                    
				    
% Parâmetros
a = 1;                              % Abreviação
c1 = 1.0/(2.0*pi^3.0);              % Coeficiente para o Método do Subdomínio
c2 = 1.0/(pi^4.0);                  % Coeficiente para o Método da Colocação
c3 = 4.0/(pi^5.0);                  % Coeficiente para o Método dos Mínimos Quadrados
c4 = 4.0/(pi^5.0);                  % Coeficiente para o Método de Galerkin
w1=[];w2=[];w3=[];w4=[];
%-----------------------------------------------------------------
% Calculo das curvas
for i=1:1:n
  x(i) = (i-1)/(n-1); % Vetor Igualmente Espaçado
  exata(i) =(x(i)^4.0-2.0*x(i)^3.0+x(i))*a/24.0;   % Solução Exata
  %
  w =  sin(pi*x(i));                             % E.D. do tipo Dy/Dx = sin(pi*x(i))
  w1(i) = c1*a*w;                                % Método dos Sub-Regiões
  w2(i) = c2*a*w;                                % Método da Colocação
  w3(i) = c3*a*w;                                % Método dos Mínimos Quadrados
  w4(i) = c4*a*w;                                % Método de Galerkin
end

%-----------------------------------------------------------------
% plot
hold on;
figure(1);title('Métodos dos Resíduos Ponderados'),grid on;
plot(x,exata,'b',x,w1,'r',x,w2,'g',x,w3,'p',x,w4,'k');
legend('Solução Exata','Método dos Subdomínios','Método da Colocação','Método dos Mínimos Quadrados','Método de Galerkin')
