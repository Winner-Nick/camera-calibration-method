function [Xt,Yt,Zt,T]=calcuXYZt(Y,m)
%C=-(Y(2)/m(2));%建立转轴方程 联立平面方程 令Y=0
C=-(m(2)/Y(2));%建立转轴方程 联立平面方程 令Y=0
%X=m(1)*C+Y(1);%计算X常量
%Z=m(3)*C+Y(3);%计算Z常量
X=Y(1)*C+m(1);%计算X常量
Z=Y(3)*C+m(3);%计算Z常量
YY=0;%相机XZ平面方程
T=-[X YY Z];%平移向量
Xc=[1;0;0];
Yt=Y;
a=cross(Xc,Yt);%向量叉乘
Zt=a/norm(a);
b=cross(Zt,Yt);
Xt=b/norm(b);
save XYZ.mat Xt Yt Zt T
end
