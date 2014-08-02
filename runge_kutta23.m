% Método de Runge Kutta de 4ª Ordem
% flida - edo
% freal - sol. exata
% a - intervalo inferior
%Com Cálculo do Erro
clc;
flida = input('Digite a Funcao: ');
funcao = inline(flida,'t','y');
freal = input('Solução exata: ');
real = inline(freal,'t');

fprintf('Entre com as extremidades do intervalo\n');
a= input('A: ');
b= input('B: ');

alfa = input('Condição inicial: ');
h = input('Valor de H: ');

n = (b-a)/h;
ti=zeros(1,n+1);
ti(1,1) = a;
w = alfa;
y = real(ti(1,1));
%fprintf('t0 = %f  w0 = %f\n',ti(1,1),w);
fprintf('t0 = %f w0 = %f y = %f erro = %f\n',ti(1,1),w,y,abs(w-y));

for  i= 1:1:n
    t = ti(1,i);
    K1 = h * funcao(t,w);
    K2 = h * funcao((t+h/2),(w+K1/2));
    K3 = h * funcao((t+h/2),(w+K2/2));
    K4 = h * funcao((t+h),(w+K3));
    w = w + ((K1 + 2*K2 + 2*K3 + K4)/6);
    
    ti(1,i+1) = a + i * h;
    y = real(ti(1,i+1));
    %ti  ---- aproximação runge kutta de 4ª Ordem --- valor real ----  erro%
    fprintf('t%d = %f w%d = %f y = %f erro = %f\n',i,ti(1,i+1),i,w,y,abs(w-y));  
end