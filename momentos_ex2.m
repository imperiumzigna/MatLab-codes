clear
clf;
clc;
syms x;
L=@(x) (-diff(x,2));
a=0;
c=1;
N=2;

k=2-x^2;
for n=1:N
b(n) =vpa(x- x^(n+1));
w(n) = vpa(x- x^(n+1));
end

for i=1:N
    for j=1:N
 
      Z(i,j)  = int(w(i)*L(b(j)),a,c);
      V(i)= int(k.*w(i),a,c);
    end
end

I=inv(Z)*V';
fx=diag(I*b);
x=a:0.1:c;
exat= x+x.^4/12-x.^2;
aprox=sum(subs(fx));
erro=aprox-exat;
%Gráfico
plot(sum(subs(fx)));
hold on, title('Método dos Momentos');
plot(exat,'-or');
legend('Aproximada','Exata');
%impressao
disp('+++++++++++++++++++++++++++++Método dos Momentos+++++++++++++++++++++++++++\n\n');
disp(' Solução Exata');
disp(exat');
disp('Solução Aproximada');                            
disp(aprox');
disp('Erro');
disp(-erro');

