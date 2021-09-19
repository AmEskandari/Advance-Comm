%Second to Run
%Caclulation of p_{q1,q2} in integral of Eq18
%It takes time to calculate
 
ttt = -3:0.1:7;
theta = -5:0.1:5;
pq0q0 = []; %In Integral Term
% pq0q1 = [];
% pq1q0 = [];
pq1q1 = [];

for i=1:101 for j=1:101 pq0q0(i,j) = cfun(0,er(j))*cfun(0,er(j)-theta(i)); end; end
%for i=1:101 for j=1:101 pq0q1(i,j) = cfun(0,er(j))*cfun(1,er(j)-theta(i)); end; end
%for i=1:101 for j=1:101 pq1q0(i,j) = cfun(1,er(j))*cfun(0,er(j)-theta(i)); end; end
for i=1:101 for j=1:101 pq1q1(i,j) = cfun(1,er(j))*cfun(1,er(j)-theta(i)); end; end

 %%
 %Amir Eskandari
 %99123138
 %Advance Communication System course Project
