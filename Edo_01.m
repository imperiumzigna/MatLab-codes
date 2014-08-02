%EDO 01 ---> u'' + u + x = 0
%Lu - P = 0
%Lu = u'' + u
%P = x
%PontosColoc 0,25 e 0.5

syms x; %Variavel simbólica

%Vetor com os coeficientes de u da EDO 1u'' + 0u' + 1u' + x = 0:
coef = [-1 -1 2 ];

%Termo independente P
P = x;

%Dominio do meu funcional (a,b)
a = 0;
b = 1;

%Pontos escolhidos para aplicar o metodo de colocação


%Chamada do método da colocação
[aproximada,pontos] = mmq( coef, P, a, b);

disp('Solução Exata:')
ue = dsolve('-D2u-Du+2*u =-x','u(0) = 0,u(1) = 0','x')

uegrafico = subs(ue, x, pontos);
erro= uegrafico-subs(aproximada);
erro'
plot(pontos,uegrafico,'--b',pontos,aproximada,'or'); legend('Solução Exata','Soluçao Aprox.');
title('Método dos Mínimos Quadrados');