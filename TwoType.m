clc
clear
format short g
tic
rand('state',sum(100*clock));
n=80000;m=1000;lamba1=1/1.5;lamba2=1/3;mu2=1/0.42;
for j=1:m
    Hcspan=exprnd(lamba1,1,n);Lcspan=exprnd(lamba2,1,n);sspan=exprnd(mu2,1,n);
    Hctime(1)=Hcspan(1);Lctime(1)=Lcspan(1);
    for i=2:n
        Hctime(i)=Hctime(i-1)+Hcspan(i);
        Lctime(i)=Lctime(i-1)+Lcspan(i);
    end
    %生成1到12间的随机数作为一开始进入服务的人
    flagH=randi(12);
    flagL=13-flagH;
    gtime(1:flagH)=Hctime(1:flagH)+sspan(1:flagH);
    gtime((flagH+1):13)=Lctime(1:flagL)+sspan((flagH+1):13);
    Hwtime(1:flagH)=0;Lwtime(1:flagL)=0;
    flag=gtime(1:13);
    one=0;two=0;three=0;four=0;
    for i=14:20000
        flagH_next=Hctime(flagH+1);
        flagL_next=Lctime(flagL+1);
        check=min(flag);
        if (flagH_next<=check)
            flagH=flagH+1;
            gtime(i)=check+sspan(i);
            Hwtime(flagH)=check-flagH_next;
            flag(find(flag==min(flag)))=[gtime(i)];
        else
            if (flagL_next<=check)
                flagL=flagL+1;
                gtime(i)=check+sspan(i);
                Lwtime(flagL)=check-flagL_next;
                flag(find(flag==min(flag)))=[gtime(i)];
            else
                if (flagH_next<=flagL_next)
                    flagH=flagH+1;
                    gtime(i)=flagH_next+sspan(i);
                    Hwtime(flagH)=0;
                    flag(find(flag==min(flag)))=[gtime(i)];
                else
                    flagL=flagL+1;
                    gtime(i)=flagL_next+sspan(i);
                    Lwtime(flagL)=0;
                    flag(find(flag==min(flag)))=[gtime(i)];
                end
            end
        end
    end
    for i=20001:n
        flagH_next=Hctime(flagH+1);
        flagL_next=Lctime(flagL+1);
        check=min(flag);
        if (flagH_next<=check)
            flagH=flagH+1;
            gtime(i)=check+sspan(i);
            Hwtime(flagH)=check-flagH_next;
            flag(find(flag==min(flag)))=[gtime(i)];
            one=one+1;
        else
            if (flagL_next<=check)
                flagL=flagL+1;
                gtime(i)=check+sspan(i);
                Lwtime(flagL)=check-flagL_next;
                flag(find(flag==min(flag)))=[gtime(i)];
                two=two+1;
            else
                if (flagH_next<=flagL_next)
                    flagH=flagH+1;
                    gtime(i)=flagH_next+sspan(i);
                    Hwtime(flagH)=0;
                    flag(find(flag==min(flag)))=[gtime(i)];
                    three=three+1;
                else
                    flagL=flagL+1;
                    gtime(i)=flagL_next+sspan(i);
                    Lwtime(flagL)=0;
                    flag(find(flag==min(flag)))=[gtime(i)];
                    four=four+1;
                end
            end
        end
    end
    result1(j)=sum(Hwtime(20001:flagH))/(flagH-20000);
    result2(j)=sum(Lwtime(20001:flagL))/(flagL-20000);
end
result_1=sum(result1)/m
Lq1=1/lamba1*result_1
result_2=sum(result2)/m
Lq2=1/lamba2*result_2

toc