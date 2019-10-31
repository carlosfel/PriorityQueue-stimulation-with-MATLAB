#### well this is coded for my course program
#### i use matlab to stimulate a queueing system 
#### In the system,we have two types of customers,one type have non-premitive priority over the other type

#### 代码TypeB参考自`https://blog.csdn.net/qq_29831163/article/details/89738145`中代码
#### TwoType是我的实现，应用多服务台两类顾客的排队情况，一类对另一类有非强占优先权。每一类内部排队遵循FCFS服务规则

#### 对于TwoType.m中参数的解释：
>n=80000;m=1000;lamba1=1/1.5;lamba2=1/3;mu2=1/0.42;  

>n为模拟时长，m为模拟次数，lamba1为高优先级顾客到达速率 ，lamba2为低优先级顾客到达速率，mu2为服务速率  

>改变服务台数量需要在下方代码中具体修改    