function [Xt,Yt,Zt,T]=calcuXYZt(Y,m)
%C=-(Y(2)/m(2));%����ת�᷽�� ����ƽ�淽�� ��Y=0
C=-(m(2)/Y(2));%����ת�᷽�� ����ƽ�淽�� ��Y=0
%X=m(1)*C+Y(1);%����X����
%Z=m(3)*C+Y(3);%����Z����
X=Y(1)*C+m(1);%����X����
Z=Y(3)*C+m(3);%����Z����
YY=0;%���XZƽ�淽��
T=-[X YY Z];%ƽ������
Xc=[1;0;0];
Yt=Y;
a=cross(Xc,Yt);%�������
Zt=a/norm(a);
b=cross(Zt,Yt);
Xt=b/norm(b);
save XYZ.mat Xt Yt Zt T
end
