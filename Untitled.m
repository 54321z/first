%程序功能：模拟DCT编码解码过程，生成带“块效应”的图像
%步骤：灰度图像→DCT→量化→反量化→IDCT
%下一步目标：实现对任意大小图象的处理。（判断图象大小，若不是2的整数次方，则补零）
I=imread('cameraman.tif')
I=im2double(I)                 %转换图像矩阵为双精度型。
T=dctmtx(8)                    %产生二维DCT变换矩阵
%计算二维DCT，矩阵T及其转置是DCT函数P1*X*P2的参数
a1=[16 11 10 16 24  40  51  61;
    12 12 14 19 26  58  60  55;
    14 13 16 24 40  57  69  56;
    14 17 22 29 51  87  80  62;
    18 22 37 56 68  109 103 77;
    24 35 55 64 81  104 113 92;
    49 64 78 87 103 121 120 101;
    72 92 95 98 112 100 103 99 ];
for i=1:8:200
    for j=1:8:200
        P=I(i:i+7,j:j+7);
        K=T*P*T';
        I2(i:i+7,j:j+7)=K;
        K=K./a1;%量化
        K(abs(K)<0.03)=0;
        I3(i:i+7,j:j+7)=K;
    end
end
figure;
imshow(I2);
title('DCT变换后的频域图像');%显示DCT变换后的频域图像
for i=1:8:200
    for j=1:8:200
        P=I3(i:i+7,j:j+7).*a1;%反量化
        K=T'*P*T;
        I4(i:i+7,j:j+7)=K;
    end
end
figure;
imshow(I4);
title('复原图像');
imwrite(I4,'复原图像6.jpg');
B=blkproc(I,[8,8],'P1*x*P2',T,T') %二值掩模，用来压缩DCT系数，只留下DCT系数中左上角的10个
mask=[1 1 1 1 0 0 0 0
      1 1 1 0 0 0 0 0
      1 1 0 0 0 0 0 0
      1 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0
      0 0 0 0 0 0 0 0 ]
B2=blkproc(B,[8 8],'P1.*x',mask)                  %只保留DCT变换的10个系数
I2=blkproc(B2,[8 8],'P1*x*P2',T',T)             %重构图像
figure
imshow(I)
title('原始图像');
figure
imshow(I2);
title('压缩图像');
figure
imshow(dct2(I));
figure
mesh(dct2(I))
colorbar('horiz')