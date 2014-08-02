% MALHA_RET
% Função para subdivisão de uma malha em quadrados
% 
% tipo:  [malha_subdividida m]= malha_ret(disc,n)
%
% Legenda: 
% disc - vetor com os pontos da malha discretizados
% n - número de subdivisões
% malha_subdividida - matriz com toda a nova malha
% m - vetor com os pontos que foram dividos
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Exemplo: [p q]= malha_ret([1.2323 2.3434 4.5454],3);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% Lembrete: Sempre colocar n+1 divisões, caso queira dividir em 2, n=3
%
function [malha_subdividida m]= malha_ret(disc,n)
fim=length(disc);
fid=fopen('malha_div.txt','w');
if n<=1
    disp('Número de Divisões insuficiente...');
else     
    for i=1:fim-1
         m2=linspace(disc(i),disc(i+1),n);
         fprintf(fid,'%f\r\n',m2);
   if i==fim+1
       break
   end
    end
fclose(fid);
f_novo=fopen('malha_div.txt','r');
malha_subdividida=fscanf(f_novo,'%f',[inf]);
fclose(f_novo);
m=meshgrid(malha_subdividida');
%mesh(m);
end

