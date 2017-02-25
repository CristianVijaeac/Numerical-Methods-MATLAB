function [x0,y0]=CentroidOfSurface(x,y)
sum1=0;
sum2=0;
sum3=0;
n=length(x);
for i=1:n-1
    sum1=sum1+x(i)*y(i+1)-x(i+1)*y(i);
end
B=sum1/2;
for i=1:n-1
    sum2=sum2+(x(i)+x(i+1))*(x(i)*y(i+1)-x(i+1)*y(i));
    sum3=sum3+(y(i)+y(i+1))*(x(i)*y(i+1)-x(i+1)*y(i));
end
x0=(1/(6*B))*sum2;
y0=(1/(6*B))*sum3;
end