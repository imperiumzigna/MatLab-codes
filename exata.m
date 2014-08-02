function exata(eqn,a,b,n,cc)
%eqn = String com EDO
% a= intervalo inferior
% b= intervalo superior
% n= Número de Pontos 
x=linspace(a,b,n);
y=dsolve(eqn,cc,'x');
z=eval(vectorize(y));
plot(x,z,'ok'); hold on, grid on;
end