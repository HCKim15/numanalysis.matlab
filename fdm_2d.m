clear

n=input('자연수를 입력하세요 : ');

h=(n+1)^2;
x=zeros(2,h);
a=0:1/n:1;
b=ones(1,h);
B=zeros(1,h-((n-1)*(n-1)));
I=zeros(1,(n-1)*(n-1));

N=1:h;

for i=1:n+1
    
    x(1,(n+1)*i-n:(n+1)*i)=a;
    x(2,(n+1)*i-n:(n+1)*i)=a(i)*b((n+1)*i-n:(n+1)*i);
   
    I((n-1)*i-(n-2):(n-1)*i)=N((n+1)*i-(n-1):(n+1)*i-1);
    
end

x=x';

I=I(n:end-(n-1));
N(I)=[];
B=N;