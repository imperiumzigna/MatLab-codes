% MDF_MALHA
%
% Autor: Igor Amorim Silva
% Ano: 2014
%
% Função para discretização de um espaço dado por uma EDO de 2ª Ordem
%
% tipo:  [d2ydu]= mdf_malha(funcao,a,b,cc1,cc2,n)
% legenda:
% funcao = Char ' ' com edo 2ª ordem na forma autônoma da equação
% a = limite inferior
% b = limite superior
% cc1 = condição de contorno 1
% cc2 = condição de contorno 2
% n = número de pontos a discretizar
% ord = ordem da ED
% opt = o tipo de discretização 'a' (anterior) 'c' (central) 'p' (próxima)
% Obs.: n deve ser >0
%
% Exemplo
%
% [malha discret] = mdf_malha('x+exp(x)',0,2,1,0,5)
function [p_malha, disc]= testes(funcao,a,b,cc1,cc2,n)
fim=n+1;
% Prealocação
%disc=zeros(fim);
%u=zeros(fim);

if n<=0
    disp('Número de Pontos Insuficiente..');
end

f=inline(funcao);
delta= (b-a)/n;
y=linspace(a,b,fim);
% Substituição dos pontos na ED
for j=1:fim
    u(j)=f(y(j));
end
%

% Inicio Disc
for i=1:fim
    for j=2:fim
        % Discretizações // a editar
       disc(i)= u(j)-2.*u(i)+u(j-1)/delta^2;
    end
end
p_malha=meshgrid(disc);
end

