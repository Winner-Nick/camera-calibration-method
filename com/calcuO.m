clear

%����õ��ռ�ԲԲ��

I=importdata('point4_13_3.txt');

figure;
hold on;
ii=1;
num=14;
nick1=false;
nick2=false;
nick3=false;
nick4=false;

%for i=3:8
%for i=[11 20 29 38 47 56]
%for i=[1:40]
for i=[1 3:9 11:30]
Aa=I([num*i-num+1:num*i],:);%�궨ͼƬ��*i(ѡȡԲ)-ͼƬ����һ���궨ͼƬ��*i��
X=Aa';
h1=plot3(X(1,:), X(2,:), X(3,:), 'r.','markersize',15);

if nick1
    legend off
    legend([h1],'corner of the chessboard');
    continue
end

%scatter3(x, y, z)%,'filled')  %ɢ��ͼ������'filled'��ʾ��ʵ�ĵ�
%hold on;
[O, R, F] = ff(X);
%plot3(O(1), O(2), O(3), 'k*');
c = num2str(i);
text(O(1), O(2), O(3),c);

if nick2
    legend off
    legend([h1],'corner of the chessboard');
    continue
end

U(ii,:)=O;%ÿ��Բ����ΪU�����һ��
ii=ii+1;
%eval(['U','',num2str(i),'=','[O(1) O(2) O(3)]',';']);
P = cross(F, F+[0; 0; norm(F)]);
P = O + P*R/norm(P);
n = 100;
for t = 0:n
    l = cross(O-P, F);
    l = l/norm(l);
    P = P + tan(2*pi/n)*R*l;
    P = O + (P-O)*cos(2*pi/n);
   h3=plot3(P(1), P(2), P(3),'k.');% '.');

hold on;
end


if nick3
    legend off
    legend([h1,h3],'corner of the chessboard','The fitted space circle');
    continue
end

h2=plot3(O(1), O(2), O(3), 'r*','markersize',10,'LineWidth',1);

if nick4
    legend off
    legend([h1,h3,h2],'corner of the chessboard','fitted space circle','center of the fitted space circle');
    continue
end

end


%% ����ƽ��ֵ����ϵ�ֱ�߱ع��������������ƽ��ֵ��
x=U(:,1);
y=U(:,2);
z=U(:,3);
xyz0(1)=mean(x);
xyz0(2)=mean(y);
xyz0(3)=mean(z);%��ϵ�����


%% ����ֱ�߷���
import comEX.*;
[Y,m]=pca1(U);%pca���ɷַ���

%% ��ͼ
t = -9:0.1:9;
xx = xyz0(1) + Y(1) * t;
yy = xyz0(2) + Y(2) * t;
zz = xyz0(3) + Y(3) * t;

h4 = plot3(xx, yy, zz, 'LineWidth', 2);

% Set plot style to Nature style
set(gca, 'FontName', 'Arial', 'FontSize', 13, 'LineWidth', 1);

legend off
%legend([h1 h3 h2 h4], '�궨��ǵ�', '��Ͽռ���Բ', '�ռ����Բ��', '�����ת��')
legend([h1 h3 h2 h4], 'corner of the chessboard', 'fitted space circle', 'center of the fitted space circle', 'fitted rotation axis');
legend([h2 h4], 'center of the fitted space circle', 'fitted rotation axis');

title('3D Plot of Fitted Circles and Axes', 'FontName', 'Arial', 'FontSize', 21);
xlabel('X-axis', 'FontName', 'Arial', 'FontSize', 19);
ylabel('Y-axis', 'FontName', 'Arial', 'FontSize', 19);
zlabel('Z-axis', 'FontName', 'Arial', 'FontSize', 19);
grid on;
box on;

% Save the figure
saveas(gcf, '3D_Plot_of_Fitted_Circles_and_Axes.png');

%%

%save('O.mat', 'U*') %����Բ������
save U.mat U;

function [O, R, F] = ff(X)
n = size(X, 2);
    function L = L(t)
        O = t(1:3); R = t(4);
        P = repmat(O, 1, n) - X;
        L = sum(abs(sqrt(sum(P .* P, 1)) - R));
    end

O0 = mean(X, 2);
R0 = norm(O0 - X(:, 1));
OR = fminsearch(@L, [O0; R0], optimset('MaxFunEvals', 1000000));
O = OR(1:3);
R = OR(4);

P = repmat(O, 1, n) - X;
[v, d] = eig(P * P');
[t, i] = min(max(d));
F = v(:, i);
end

