function A=Mangle(n)
for i=1:n%nΪ��ͼ������
b=(2*pi*(i-1)/n)+(2*pi/n);
%b=(2*pi*(i-1)/n);%���һ�����ĵ�ͼ�����Ļ���
eval(['a',num2str(i),'=','b',';']);
A(i,:)=b;
save('A.mat','a*');
end
end
