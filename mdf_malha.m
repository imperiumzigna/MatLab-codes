% MDF_MALHA
%
% Autor: Igor Amorim Silva
% Ano: 2014
%
% Função para discretização (avançada,central,recuada) de um espaço dado por uma EDO
%
% tipo:  [d2ydu]= mdf_malha(funcao,a,b,cc1,cc2,n)
% legenda:
%
% funcao = Char ' ' com edo na forma y^n+y^n-1...+y=0
% a = limite inferior
% b = limite superior
% cc1 = condição de contorno 1
% cc2 = condição de contorno 2
% n = número de pontos a discretizar
% ord = ordem da ED
% opt = o tipo de discretização 'a' (anterior) 'c' (central) 'p' (próxima)
%
% Obs.1: n deve ser >0
% Obs.2: em ED's de ordem 3 ou superior, n>=2
% Exemplo
%
% [malha discret] = mdf_malha('x+exp(x)',0,2,1,0,3,2,'c');
%
function [p_malha, disc]= mdf_malha(funcao,a,b,cc1,cc2,n,ord,opt)
fim=n+1;
f=inline(funcao);
delta= (b-a)/n;
y=linspace(a,b,fim);
if n<=0
    error('Número de Pontos Insuficiente..');
end
for j=1:fim
    u(j)=f(y(j));
end



% Substituição dos pontos na ED

% Inicio Disc
for i=1:fim
    for j=2:fim
        for k=3:fim
            % Discretizações // a editar
            if ord==1 && opt=='p'
                disc(i)=(u(j)-u(i))/delta;
            end
            if ord==1 && opt=='a'
                disc(i)=(u(i)-u(j-1))/delta;
            end
            if ord==1 && opt=='c'
                disc(i)=(u(j)-u(i))/2*delta;
            end
            if ord==2 && opt=='a'
                disc(i)=(u(j)-2.*u(j-1)+u(i))/delta^2;
            end
            
            if ord==2 && opt=='p'
                disc(i)=(u(j+1)-2.*u(j)+u(i))/delta^2;
            end
            if ord==2 && opt=='c'
                disc(i)= u(j)-2.*u(i)+u(j-1)/delta^2;
            end
            if ord==3
                if n==1
                    n=n+1;
                    disc(i)=(u(k)-2.*u(j)+2.*u(j-1)-u(k-2))/2*delta^3;
                end
            end
            if ord==4
                if n==1
                    n=n+1;
                    disc(i)=(u(k)-4.*u(j)+6.*u(i)-u(j-1)+u(k-2))/delta^4;
                end
            end
        end
    end
end
p_malha=meshgrid(disc);
end

