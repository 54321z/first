for i = 1:68
    for j = 1:71
        x = dec2bin(a(i,j,1));
        y = dec2bin(b(i,j,1));
        for lenx = 1:8-length(x)
            x = ['0',x];
        end
       for leny = 1:8-length(y)
            y = ['0',y];
       end       
        x
        y
        %�滻
        x(5:8) = y(1:4);
        x
        y
        %ת��Ϊʮ����
        x = bin2dec(x)
        y = bin2dec(y)
        %д��a�ļ�
        a(i,j,1) = x;
    end
end
imshow(a);
