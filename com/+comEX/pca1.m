function [Y,m]=pca1(K)
[r,~]=size(K);%�õ����������
for i=1:r
m=sum(K)/r;
%m=sum(K)/3;
a=K(i,1)-m(1);
b=K(i,2)-m(2);
c=K(i,3)-m(3);
X=[a b c];
A(i,:)=X;
end
c=cov(A);%Э�������yuanban
%c=A*A';
[x,y]=eig(c);%����������ֵ������������xΪ������������yΪ����ֵ����
eigenvalue=diag(y);%��Խ�������
lamda=max(eigenvalue);%���������ֵ
for i=1:length(c)%���������ֵ��Ӧ������
    if lamda==eigenvalue(i)
        break;
    end
end
y_lamda=x(:,i);%������������ֵ��Ӧ����������
Y=y_lamda;
save  Y.mat Y m
end