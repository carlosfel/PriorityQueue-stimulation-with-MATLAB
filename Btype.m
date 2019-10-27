clc
clear
format short g
tic
rand('state',sum(100*clock));
n=60000;m=1000;mu1=1/5.2;mu2=1/0.42;
for j=1:m
    cspan=exprnd(mu1,1,n);sspan=exprnd(mu2,1,n);
    ctime(1)=cspan(1);
    for i=2:13
        ctime(i)=ctime(i-1)+cspan(i);
    end
    gtime(1:13)=ctime(1:13)+sspan(1:13);
    wtime(1:13)=0;
    flag=gtime(1:13);
    for i=14:n
        ctime(i)=ctime(i-1)+cspan(i);
        gtime(i)=max(ctime(i),min(flag))+sspan(i);
        wtime(i)=max(0,min(flag)-ctime(i));
        flag(find(flag==min(flag)))=[gtime(i)];
    end
    result2(j)=sum(wtime)/n;
end
result_2=sum(result2)/m
toc