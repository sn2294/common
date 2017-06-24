function kstar=s2ar(yts,penalty,kmax,kmin);
nt=rows(yts);
min=9999999999;
tau=zeros(kmax+1,1);
s2e=999*ones(kmax+1,1);

dyts=mydiff(yts,1);
reg=lagn(yts,1);
for i=1:kmax;
reg=[reg lagn(dyts,i)];
end;
dyts0=dyts;
reg0=reg;
dyts0=trimr(dyts,kmax+1,0);
reg0=trimr(reg,kmax+1,0);
sumy=sum(reg0(:,1).*reg0(:,1));
nef=nt-kmax-1;
for k=kmin:kmax;
b=myols(dyts0,reg0(:,1:k+1));
e=dyts0-reg0(:,1:k+1)*b;
s2e(k+1)=e'*e/nef;
tau(k+1)=(b(1)*b(1))*sumy/s2e(k+1);
end;
kk=seqa(0,1,kmax+1);
if penalty == 0;
mic=log(s2e)+2.0*(kk+tau)./nef;
else;
mic=log(s2e)+log(nef)*(kk)./nef;
end;
kstar=minindc(mic)-1;
