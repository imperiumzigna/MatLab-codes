clc;clear;clf;
fprintf('iteração\ttempo\n');
fid = fopen('resultados_ex3_ode23.txt', 'w');

fprintf(fid, 'Iteração Tempo\r\n\n');
% Runge Kutta 23 ode23
tic;
for n=1:100

sol=dsolve('D4y+2*D3y+D2y+8*Dy-12*y=12*sin(x)-exp(-x)','y(0)=3,Dy(0)=0,D2y(0)=-1,D3y(0)=2','x');
t(n)=toc;
fprintf(fid,'%d\t%f\r\n',n,t(n));
fprintf('%d\t%f\n',n,t(n));
end
fclose(fid);

type resultados_ex3_ode23.txt;

plot(t,'--b');
hold on;
fprintf('iteração\ttempo\n');
% Segunda parte
fid2 = fopen('resultados_ex3_ode45.txt', 'w');

fprintf(fid2, 'Iteração Tempo\r\n\n');
% Runge Kutta 45 45
for n=1:100
tic;
sol=dsolve('D4y+2*D3y+D2y+8*Dy-12*y=12*sin(x)-exp(-x)','y(0)=3,Dy(0)=0,D2y(0)=-1,D3y(0)=2','x');
tnovo(n)=toc;
fprintf(fid2,'%d\t%f\r\n',n,t(n));
fprintf('%d\t%f\n',n,t(n));
end
type resultados_ex3_ode45.txt;
fclose(fid2);
plot(tnovo,'r');
% Rosembrok 23s
fid3 = fopen('resultados_ex3_Rosembrok.txt', 'w');

fprintf(fid3, 'Iteração Tempo\r\n\n');

for n=1:100
tic;
sol=dsolve('D4y+2*D3y+D2y+8*Dy-12*y=12*sin(x)-exp(-x)','y(0)=3,Dy(0)=0,D2y(0)=-1,D3y(0)=2','x');
t_rosen(n)=toc;
fprintf(fid3,'%d\t%f\r\n',n,t(n));
fprintf('%d\t%f\n',n,t(n));
end
type resultados_ex3_Rosembrok.txt;
fclose(fid3);
plot(t_rosen,'g')
grid on,title('Desempenho'), legend('Runge Kutta -> ode23','Runge Kutta -> ode45','Rosembrok -> ode23s'),xlabel('Iterações'),ylabel('tempo');
