function   txt2printf(filename,K,P,num)
fhandle=fopen([filename,'/','viff','.','txt'],'w');
for i=0:num-1
 fprintf(fhandle,'%s\n',num2str(i));
 %���ڲ�
 temp=K{i+1};
  [m,n]=size(temp);
 for j=1:m
for z=1:n
if z==n&&j~=m
fprintf(fhandle,'%f\n',temp(j,z)); %һ��һ�е�д�����ݣ������е����һ�����ݣ��س�
elseif z==n&&j==m
fprintf(fhandle,'%f\n',temp(j,z)); %һ��һ�е�д�����ݣ������һ�е����һ�����ݣ����س�
else
fprintf(fhandle,'%f      ',temp(j,z)); %������������֮���2���ַ����൱�ڰ�һ��Tab��
end
end
 end

fprintf(fhandle,'0  0\n');

%�����
temp=P{i+1};
[m,n]=size(temp);
 for j=1:m
for z=1:n
if z==n&&j~=m
fprintf(fhandle,'%f\n',temp(j,z)); %һ��һ�е�д�����ݣ������е����һ�����ݣ��س�
elseif z==n&&j==m
fprintf(fhandle,'%f\n',temp(j,z)); %һ��һ�е�д�����ݣ������һ�е����һ�����ݣ����س�
else
fprintf(fhandle,'%f      ',temp(j,z)); %������������֮���2���ַ����൱�ڰ�һ��Tab��
end
end
end
fprintf(fhandle,'\n');

end
fclose(fhandle);