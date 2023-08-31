function   txt2printf(filename,K,P,num)
fhandle=fopen([filename,'/','viff','.','txt'],'w');
for i=0:num-1
 fprintf(fhandle,'%s\n',num2str(i));
 %读内参
 temp=K{i+1};
  [m,n]=size(temp);
 for j=1:m
for z=1:n
if z==n&&j~=m
fprintf(fhandle,'%f\n',temp(j,z)); %一行一行的写入数据，到该行的最后一个数据，回车
elseif z==n&&j==m
fprintf(fhandle,'%f\n',temp(j,z)); %一行一行的写入数据，到最后一行的最后一个数据，不回车
else
fprintf(fhandle,'%f      ',temp(j,z)); %相邻两个数据之间隔2个字符，相当于按一次Tab键
end
end
 end

fprintf(fhandle,'0  0\n');

%读外参
temp=P{i+1};
[m,n]=size(temp);
 for j=1:m
for z=1:n
if z==n&&j~=m
fprintf(fhandle,'%f\n',temp(j,z)); %一行一行的写入数据，到该行的最后一个数据，回车
elseif z==n&&j==m
fprintf(fhandle,'%f\n',temp(j,z)); %一行一行的写入数据，到最后一行的最后一个数据，不回车
else
fprintf(fhandle,'%f      ',temp(j,z)); %相邻两个数据之间隔2个字符，相当于按一次Tab键
end
end
end
fprintf(fhandle,'\n');

end
fclose(fhandle);