%Third to run
%Calculation Eq20 for f = 1:100hz

temmp = [];
result = [];
rcc = [];

for f=1:100
for i=1:101 for j=1:101 temmp(1,i,j) = pq0q0(i,j)*exp(-complex(0,1)*f*2*pi*er(j)); end; end
%for i=1:101 for j=1:101 temmp(2,i,j) = pq0q1(i,j)*exp(-complex(0,1)*f*2*pi*er(j)); end; end
%for i=1:101 for j=1:101 temmp(3,i,j) = pq1q0(i,j)*exp(-complex(0,1)*f*2*pi*er(j)); end; end
for i=1:101 for j=1:101 temmp(4,i,j) = pq1q1(i,j)*exp(-complex(0,1)*f*2*pi*er(j)); end; end

for i=1:101
%result1(i) = sum(temmp(1,i,:))+sum(temmp(2,i,:))+sum(temmp(3,i,:))+sum(temmp(4,i,:));
result1(i) = sum(temmp(1,i,:))+sum(temmp(4,i,:));
end

rcc(f,:) = result1;
end

 %%
 %Amir Eskandari
 %99123138
 %Advance Communication System course Project