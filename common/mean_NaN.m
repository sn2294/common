function good_mean=mean_NaN(yy,mask);
T=size(yy,1);
N=size(yy,2);
x=yy;
one=ones(T,1);
good_mean=[];
for i=1:N;
  igood=find(not(isnan(yy(:,i))));
  y=yy(igood,i);
  good_mean= [good_mean; mean(y) length(igood)]; 
end;