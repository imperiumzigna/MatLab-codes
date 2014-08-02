clear
clf;
clc;
syms x;

L=input('Operador:');
a=input('Intervalor Inferior:');
c=input('Intervalo Superior:');
N=input('Número de Iterações:');

k=input('Função Conhecida:');
exat= input('Solução Exata:');
for n=1:N
b(n) =vpa(input('Função de Aproximação:')); %Função de Aproximação
w(n) = vpa(input('Função de Ponderação:')); %Funão de Ponderação
end

for i=1:N
    for j=1:N
       Z(i,j)  = int(w(i)*L(b(j)),a,c); %Matriz das integrais da função de ponderação * o operador com a função de aproximação substituida
      V(i)= int(k.*w(i),a,c); %Matriz  das integrais da função conhecida * função de ponderação
    end
end

I=inv(Z)*V';
fx=diag(I*b);
x=a:0.1:c;

aprox=sum(subs(fx));
erro=aprox-exat;
%Gráfico
plot(sum(subs(fx)));
hold on, title('Método dos Momentos');
plot(exat,'-or');
legend('Aproximada','Exata');
%impressao
fprintf('+++++++++++++++++++++++++++++Método dos Momentos+++++++++++++++++++++++++++\n\n');
fprintf(' Solução Exata                  Solução Aproximada                            Erro\n\n');
fprintf('%.3f\t%.4f\t%.4f\n',exat,aprox,erro);

