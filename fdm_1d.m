clear

n=input('자연수를 입력하세요(input a natural number) : ');

h=1/n;
A=zeros(n-1,n-1);
b=zeros(1,n-1);
x=zeros(1,n+1);
x(n+1)=1;

for i=1:n-1
    
    x(i+1)=i*h;
    b(i)=-(pi^2)*sin(pi*x(i+1));
    A(i,i:i+2)=[1,-2,1];
    
end

A=A(:,2:n);
b=b*(h^2);

u=A\b';
u=[0;u;0];

figure(1) 
t=0:0.01:1; 
plot(t,sin(pi*t))
xlabel('x')
ylabel('u(x)')
ylim([0,1.2])
hold on
plot(x,u,'.','MarkerSize',12)
title(['Numerical solution to the Poisson equation with h=1/', num2str(1/h)])
legend('exact', 'approx')
