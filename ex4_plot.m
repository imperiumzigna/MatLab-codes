clc;clear;clf;

fid = fopen('resultados_ex4_ode45_comparacao_ode15s.txt', 'w');
fprintf('iteração\ttempo\n');
fprintf(fid, 'Iteração Tempo\r\n\n');
delta = 0.0001;
F = inline('y^2 - y^3','t','y');
opts = odeset('RelTol',1.e-4);
tic
for n=1:30
sol=ode45(F,[0 2/delta],delta,opts);
t(n)=toc;
fprintf(fid,'%d\t%f\r\n',n,t(n));
fprintf('%d\t%f\n',n,t(n));
end
fclose(fid);
type resultados_ex4_ode45_comparacao_ode15s.txt;
%  Parte 2

fid2 = fopen('resultados_ex4.1_ode23s_adaptativo.txt', 'w');
fprintf('iteração\ttempo\n');
fprintf(fid2, 'Iteração Tempo\r\n\n');
tic
for n=1:30
sol2=ode23s(F,[0 2/delta],delta,opts);
t2(n)=toc;
fprintf(fid2,'%d\t%f\r\n',n,t(n));
fprintf('%d\t%f\n',n,t(n));
end
fclose(fid2);
type resultados_ex4.1_ode23s_adaptativo.txt;
hold on;
plot(t,'--b');
plot(t2,'--r');
title('Desempenho'),xlabel('iterações'),ylabel('tempo'), legend('Runge Kutta -> ode45','Método Adaptativo ->ode23s')