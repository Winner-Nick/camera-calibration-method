function  R1=calcuR1(Yt,Xt)
Yz=[0 1 0];%ת̨����ϵY��ķ�������
U=cross(Yt,Yz)/norm(cross(Yt,Yz));
the=acos(dot(Yt,Yz)/(norm(Yt)*norm(Yz)));
I=eye(3);
a=U(1,1);
b=U(1,2);
d=U(1,3);
o=[0 -d b
   d 0 -a
  -b a 0];
x=[a*a a*b a*d;a*b b*b b*d;a*d b*d d*d];
Ry=I*cos(the)+sin(the)*o+(1-cos(the))*x;%�������ϵ��ת̨��Y�᷽��������ת̨����ϵ��Y�����

Xz=[1 0 0];%ת̨����ϵX��ķ�������
U1=cross(Xt,Xz)/norm(cross(Xt,Xz));
the1=acos(dot(Xz,Xt)/(norm(Xz)*norm(Xt)));
I1=eye(3);  
a1=U1(1,1);
b1=U1(1,2);
d1=U1(1,3);
o1=[0 -d1 b1;d1 0 -a1;-b1 a1 0];
x1=[a1*a1 a1*b1 a1*d1;a1*b1 b1*b1 b1*d1;a1*d1 b1*d1 d1*d1];
Rx=I1*cos(the1)+sin(the1)*o1+(1-cos(the1))*x1;%�������ϵ��ת̨��X�᷽��������ת̨����ϵ��Y�����

R1=Rx*Ry;%��ξ�������Ӧ��R1��ת��
save R.mat Rx Ry R1
end