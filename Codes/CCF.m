%forth to run
%EQ30 Gqq = P00 + p11 EQ28 Report
k = 1;
G00 = [];
G11 = [];
ccf = [];
tempccf = [];

ff = 0.5:1:50;

for k=1:50
for i=1:101 for j=1:101 tempccf (1,i,j) = pq0q0(i,j)*exp(-complex(0,1)*ff(k)*2*pi*er(j)); end; end
for i=1:101 for j=1:101 tempccf (2,i,j) = pq1q1(i,j)*exp(-complex(0,1)*ff(k)*2*pi*er(j)); end; end


for i=1:101
ccf(k,i) = sum(tempccf(1,i,:))+sum(tempccf(2,i,:));
end
end

 %%
 %Amir Eskandari
 %99123138
 %Advance Communication System course Project