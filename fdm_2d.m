clear

n=input('type natural number : ');

h=(n+1)^2;

x=zeros(2,h);
a=0:1/n:1;
c=ones(1,(n+1)^2);
b=zeros(1,(n-1)^2);
I=zeros(1,(n-1)*(n-1));



N=1:h;


%I. various ways to compute nodes

% 1. Using for loops n+1 times
for i=1:n+1
    
   x(1,(n+1)*i-n:(n+1)*i)=a;
   x(2,(n+1)*i-n:(n+1)*i)=a(i)*c((n+1)*i-n:(n+1)*i);
   
   I((n-1)*i-(n-2):(n-1)*i)=N((n+1)*i-(n-1):(n+1)*i-1);
    
end


% 2. Using for loops h times
% for i=1:h
%     
% %    c((n+1)*i-n:(n+1)*i)=0:n;
% 
%     x(1,i)=(mod(i,n+1)-1)/n;
%     if x(1,i)==-1/n
%         x(1,i)=1;
%     end
%     
%     x(2,)
%     
% %    x(1,i)=c(i)*(1/n);
% %    x(2,i)=
% 
% end



%3. Using meshgrid way.
%[Nx,Ny] = meshgrid(a,a);
%Nx = Nx';   Ny = Ny';
%Nx = Nx(:); Ny = Ny(:);

%4. Using another built in function
%Node = [reshape(repmat(a,n,1)',N,1), repelem(a,n)'];
%repmat(vector, row, col)
%repelem(vector, row, col)

%5. Find complement of the set
%I = setdiff(1:N,B);
%setdiff(A,B)

%6. Getting the boundary node (N=n+1)
%gam1 = 1:h;  gam2 = h:h:N;  gam3 = N-h+1:N;  gam4 = 1:h:N-h+1;
%B = unique([gam1,gam2,gam3,gam4]); 겹치는, 중복되는 요소를 제거. 그후 sorting을 해줌.



I=I(n:end-(n-1));
N(I)=[];
B=N;


%II. compute the matrix to get answer.

A=zeros((n-1)^2,((n-1)^2)+2*n-2);

for i=1:(n-1)^2
    
    T=[i,i+(n-2),i+(n-1),i+n,2*(n-1)+i];
    A(i,T)=[1,1,-4,1,1];
    
    
    b(i)=-2*(pi^2)*sin(pi*x(1,I(i)))*sin(pi*x(2,I(i)));
    
end

A=A(:,n:((n-1)^2)+2*n-2-(n-1));

       

for j=1:n-2
       
     A((n-1)*j,(n-1)*j+1)=0;
     A((n-1)*j+1,(n-1)*j)=0;
       
end

b=b/(n^2);
x=x';

u=A\b';
