function C=laoubivergnaud(Cin,l1,l2,D,x,t)
sum=0;
for ii=0:1000000
    sum=sum+sin((2*ii+1)*pi*l1/(2*(l1+l2)))*cos((2*ii+1)*pi*x/(2*(l1+l2)))*exp(-(2*ii+1)^2*pi^2*D*t/4/(l1+l2)^2)/(2*ii+1);
end
C=Cin*4/pi*sum;
end