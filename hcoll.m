function M = hcoll(p,q)

%computes the matrix entries for the (p,q) element

a=(p+q)/2; r=(q-p)/2;
v=[1, 1/r, 1/(r)^2]';
R=[v, r.*v, v, r.*v];

H1=[.88490017946 .262891711532 .11509982054 -.0704416218017
-.5 .288675134595 .5 -.288675134595
-.86602540378444 -1.36602540378444 .86602540378444 -.36602540378444];

H2=[.11509982054 .0704416218017 .88490017946 -.262891711532
-.5 -.288675134595 .5 .288675134595
.86602540378444 .36602540378444 -.86602540378444 1.36602540378444];

%p1 and p2 are the points in (p,q) that correspond to +-1/sqrt(3)

p1=a-r/sqrt(3); p2=a+r/sqrt(3);

%vector [A,B,C] elements are the coef of the linear ode

%A function, B first deriv, C second deriv

M(1,:)=[1, 0, 1]*(H1.*R);
M(2,:)=[1, 0, 1]*(H2.*R);