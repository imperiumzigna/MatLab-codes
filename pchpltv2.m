function pchpltv2(x,u,du)

n=length(x);
y=[]; t=[];

for i=1:n-1,

Dx=x(i+1)-x(i); Du=u(i+1)-u(i);FD=Du/Dx;
A=(FD-du(i))/Dx; SD=(du(i+1)-FD)/Dx; B=(SD-A)/Dx;
p=linspace(x(i),x(i+1),16);
s=u(i)+(p-x(i)).*(du(i)+(p-x(i)).*(A+(p-x(i+1)).*B));
y=[y,s]; t=[t,p];
[u(i),du(i), A, B];

end

plot(t,y,'b')