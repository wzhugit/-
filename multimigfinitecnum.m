function C=multimigfinitecnum(cin,D1,D2,D3,K12,K23,l1,l2,l3,VF,hm,Kpf,Th,M,nt,Ar)
l=l1+l2+l3;
h=l/M;
m1=floor(M*l1/l);
m2=floor(M*l2/l);
T=Th*3600;
tao=T/nt;

r1=2*D1*tao/h/h;
r2=2*D2*tao/h/h;
r3=2*D3*tao/h/h;
%Matrix Definition
L=zeros(M+4,M+4);
R=zeros(M+4,M+4);
for i=2:1:m1
   L(i,i)=5/6+r1/2;
   L(i,i-1)=1/12-r1/4;
   L(i,i+1)=1/12-r1/4;
   
   R(i,i)=5/6-r1/2;
   R(i,i-1)=1/12+r1/4;
   R(i,i+1)=1/12+r1/4;
end
L(1,1)=5/12+r1/4;L(1,2)=1/12-r1/4;R(1,1)=5/12-r1/4;R(1,2)=1/12+r1/4;

L(m1+1,m1)=1/12/tao-D1/h/h;L(m1+1,m1+1)=5/12/tao+D1/h/h;L(m1+1,m1+2)=5/12/tao+D2/h/h;L(m1+1,m1+3)=1/12/tao-D2/h/h;
R(m1+1,m1)=1/12/tao+D1/h/h;R(m1+1,m1+1)=5/12/tao-D1/h/h;R(m1+1,m1+2)=5/12/tao-D2/h/h;R(m1+1,m1+3)=1/12/tao+D2/h/h;

for i=m1+2+1:1:m1+m2+1
   L(i,i)=5/6+r2/2;
   L(i,i-1)=1/12-r2/4;
   L(i,i+1)=1/12-r2/4;
   
   R(i,i)=5/6-r2/2;
   R(i,i-1)=1/12+r2/4;
   R(i,i+1)=1/12+r2/4;
end
L(m1+2,m1+1)=K12;L(m1+2,m1+2)=-1;
L(m1+m2+2,m1+m2+1)=1/12/tao-D2/h/h;L(m1+m2+2,m1+m2+2)=5/12/tao+D2/h/h;L(m1+m2+2,m1+m2+3)=5/12/tao+D3/h/h;L(m1+m2+2,m1+m2+4)=1/12/tao-D3/h/h;
R(m1+m2+2,m1+m2+1)=1/12/tao+D2/h/h;R(m1+m2+2,m1+m2+2)=5/12/tao-D2/h/h;R(m1+m2+2,m1+m2+3)=5/12/tao-D3/h/h;R(m1+m2+2,m1+m2+4)=1/12/tao+D3/h/h;
for j=m1+m2+4:M+2
    L(j,j)=5/6+r3/2;
    L(j,j-1)=1/12-r3/4;
    L(j,j+1)=1/12-r3/4;
   
    R(j,j)=5/6-r3/2;
    R(j,j-1)=1/12+r3/4;
    R(j,j+1)=1/12+r3/4;  
end
L(m1+m2+3,m1+m2+2)=K23;L(m1+m2+3,m1+m2+3)=-1;
L(M+1+1+1,M+1+1)=1/12-r3/2;L(M+1+1+1,M+1+1+1)=5/12+r3/2+hm*tao/h;L(M+1+1+1,M+4)=-hm*tao/h*Kpf;
R(M+1+1+1,M+1+1)=1/12+r3/2;R(M+1+1+1,M+1+1+1)=5/12-r3/2-hm*tao/h;R(M+1+1+1,M+4)=hm*tao/h*Kpf;
for i=2:1:M+2
    L(M+4,i)=0.5*Ar*h;
    R(M+4,i)=-0.5*Ar*h;
end
L(M+4,1)=0.25*Ar*h;L(M+4,m1+1)=0.25*Ar*h;L(M+4,m1+2)=0.25*Ar*h;L(M+4,m1+m2+2)=0.25*Ar*h;L(M+4,m1+m2+3)=0.25*Ar*h;L(M+4,M+3)=0.25*Ar*h;L(M+4,M+4)=0.5*VF;
R(M+4,1)=-0.25*Ar*h;R(M+4,m1+1)=-0.25*Ar*h;R(M+4,m1+2)=-0.25*Ar*h;R(M+4,m1+m2+2)=-0.25*Ar*h;R(M+4,m1+m2+3)=-0.25*Ar*h;R(M+4,M+3)=-0.25*Ar*h;R(M+4,M+4)=-0.5*VF;
%First Iteration
x=zeros(M+4,1);
% MFT=zeros(1,nt);
CinVP=zeros(M+4,1);
CinVP(M+4,1)=cin*Ar*l1;
for i=1:1:m1+1
    x(i,1)=cin;
end
for i=m1+2:1:M+4
    x(i,1)=0;
end
C=zeros(M+4,nt);
E=L\(R*x+CinVP);
for i=1:1:M+4
    C(i,1)=E(i,1);
end

%Interation
for i=1:1:nt-1
    C(m1+2,i)=K12*C(m1+1,i);
    C(m1+m2+3,i)=C(m1+m2+2,i)*K23;
    E=L\(R*C(:,i)+CinVP);
    for j=1:1:M+4
        C(j,i+1)=E(j,1);
    end
    C(m1+2,i+1)=K12*C(m1+1,i+1);
    C(m1+m2+3,i+1)=K23*C(m1+m2+2,i+1);
end
C=C(1:end-1,:);
end



