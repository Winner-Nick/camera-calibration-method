function   txtprintf(filename,matrix,num)
fhandle=fopen([filename,'/','viff','.','txt'],'w');
fprintf(fhandle,'%s\n%s\n','<?xml version="1.0"?>','<opencv_storage>');
for i=0:num-1
 fprintf(fhandle,'%s\n',['<viff',num2str(i,'%03d'),'_matrix type_id="opencv-matrix">']);
 fprintf(fhandle,'%s\n',['  ','<rows>3</rows>']);
 fprintf(fhandle,'%s\n',['  ','<cols>4</cols>']);
 fprintf(fhandle,'%s\n',['  ','<dt>f</dt>']);
 fprintf(fhandle,'%s\n',['  ','<data>']);
 temp=matrix{i+1};
  [m,n]=size(temp);
 for j=1:m
for z=1:n
if z==n&&j~=m
fprintf(fhandle,'%f\n',temp(j,z)); %һ��һ�е�д�����ݣ������е����һ�����ݣ��س�
elseif z==n&&j==m
fprintf(fhandle,'%f',temp(j,z)); %һ��һ�е�д�����ݣ������һ�е����һ�����ݣ����س�
else
fprintf(fhandle,'%f      ',temp(j,z)); %������������֮���2���ַ����൱�ڰ�һ��Tab��
end
end
end
 fprintf(fhandle,'%s\n',['<','/data></viff',num2str(i,'%03d'),'_matrix>']);
end
fprintf(fhandle,'%s','</opencv_storage>');
fclose(fhandle);