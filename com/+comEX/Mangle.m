function A=Mangle(n)
for i=1:n%n为拍图的数量
b=(2*pi*(i-1)/n)+(2*pi/n);
%b=(2*pi*(i-1)/n);%与第一张所拍的图相间隔的弧度
eval(['a',num2str(i),'=','b',';']);
A(i,:)=b;
save('A.mat','a*');
end
end
