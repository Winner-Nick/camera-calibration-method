function [Y,m]=pca1(K)
[r,~]=size(K);%得到矩阵的行数
for i=1:r
m=sum(K)/r;
%m=sum(K)/3;
a=K(i,1)-m(1);
b=K(i,2)-m(2);
c=K(i,3)-m(3);
X=[a b c];
A(i,:)=X;
end
c=cov(A);%协方差矩阵yuanban
%c=A*A';
[x,y]=eig(c);%求矩阵的特征值和特征向量，x为特征向量矩阵，y为特征值矩阵。
eigenvalue=diag(y);%求对角线向量
lamda=max(eigenvalue);%求最大特征值
for i=1:length(c)%求最大特征值对应的序数
    if lamda==eigenvalue(i)
        break;
    end
end
y_lamda=x(:,i);%求矩阵最大特征值对应的特征向量
Y=y_lamda;
save  Y.mat Y m
end