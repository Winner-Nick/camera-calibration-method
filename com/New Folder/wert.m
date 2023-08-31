clear all
clc

%I=importdata('test.txt');
%I=importdata('3points.txt');
%I=importdata('F10point.txt');
%I=importdata('Bwheat_point.txt');
%I=importdata('Apoint.txt');
I=importdata('Fwheat_point.txt');
%I=importdata('G10point.txt');

figure;
hold on;
Ko=[];
pic_num=10;
for i=[32:33 35 40:42 46 52:55]
%Aa=I([9*i-8:9*i],:);
%Aa=I([8*i-7:8*i],:);
Aa=I([pic_num*i-pic_num+1:pic_num*i],:);
X=Aa';
plot3(X(1,:), X(2,:), X(3,:), '.');
%% 计算圆心、半径和平面法向量
[O, R, F] = ff(X);
plot3(O(1), O(2), O(3), '*');
c = num2str(i);
text(O(1), O(2), O(3),c);
eval(['U',num2str(i),'=','[O(1) O(2) O(3)]',';']);
Ko=[Ko;O'];
%eval(['H',num2str(i),num2str(j),'=','F',';']);
%save('F.mat','H*') 
%% 画圆
P = cross(F, F+[0; 0; norm(F)]);
P = O + P*R/norm(P);
n = 200;
for t = 0:n
    l = cross(O-P, F);
    l = l/norm(l);
    P = P + tan(2*pi/n)*R*l;
    P = O + (P-O)*cos(2*pi/n);
    plot3(P(1), P(2), P(3), '.');
hold on;
%end
end
end
save('U.mat','U*') 









function [O, R, F] = ff(X)
n = size(X, 2);
function L = L(t)
    O = t(1:3); R = t(4);
    P = repmat(O, 1, n)-X;
    L = sum(abs(sqrt(sum(P.*P, 1))-R));
end

O0 = mean(X, 2);
R0 = norm(O0-X(:,1));
OR = fminsearch(@L, [O0; R0], optimset('MaxFunEvals', 1000000));
O = OR(1:3);
R = OR(4);
 
P = repmat(O, 1, n)-X;
[v, d] = eig(P*P');
[t, i] = min(max(d));
F = v(:,i);
end
