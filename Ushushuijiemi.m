for k = 1:3
 for i = 1 : 27
    for j = 1 : 60
        for q = 1:8
           x = dec2bin(b(i*((q-1)+1),j*((q-1)+1),k));
           for lenx = 1:8-length(x)
            x = ['0',x];
           end
           y = dec2bin(p(i,j,k));
           for leny = 1:8-length(y)
           y = ['0',y];
           end 
           %显示为改变的前的x，y
           x
           y
            %写入
           x(8)=y(q);
            %显示改变后的x,y
           x
           y
           x=bin2dec(x)
           b(i*((q-1)+1),j*((q-1)+1),k)=x;
        end 
    end
 end
end
imshow(b)

z=zeros(27,60,3);
for k = 1:3
 for i = 1 : 27
    for j = 1 : 60
        for q = 1:8
           x = dec2bin(b(i*((q-1)+1),j*((q-1)+1),k));
           for lenx = 1:8-length(x)
            x = ['0',x];
           end
           y = dec2bin(p(i,j,k));
           for leny = 1:8-length(y)
           y = ['0',y];
           end 
           %显示为改变的前的x，y
           x
           y
            %写入
           y(q)=x(8);
            %显示改变后的x,y
           x
           y
           y=bin2dec(y)
           z(i,j,k)=y;
        end 
    end
 end
end
imshow(z)

