clc
clear

imagesignal = imread('./你的水印图片.bmp');
imagesignal = double(imagesignal);
imagesignal = im2bw(imagesignal, 0.7);
imagesignal = imresize(imagesignal, [128 128]);
watermarking = imagesignal;

subplot(2,2,1)
imshow(imagesignal)
title("原始水印")

% 图片降维
piexnum = 1;
for j=1:128
    for i=1:128
        waterimage_y(piexnum, 1) = watermarking(i, j);
        piexnum = piexnum + 1;
    end
end
waterimage_l = size(waterimage_y, 1);

[orignalwav,fs]=audioread('./你的音频文件（将水印嵌入音频里）.wav');
orignalwav = orignalwav(:, 1);
[c0, d0] = dwt(orignalwav, 'haar');
subplot(2,2,3)
plot(orignalwav)
title("原始音频信号")

for i=1:waterimage_l
    c0(i) = c0(i) * (1 + 0.1 * waterimage_y(i));
end
emmedsignal = idwt(c0, d0, 'haar');
subplot(2,2,4)
plot(emmedsignal)
title("嵌入水印后的音频信号")

[embedc0, embedd0] = dwt(emmedsignal, 'haar');
[c0, d0] = dwt(orignalwav, 'haar');
for i=1:waterimage_l
    newwater(i) = (embedc0(i)/c0(i)-1.0)/0.1;
end 

ww = 1;
for j=1:128
    for i=1:128
        newwaterimage(i, j)=newwater(ww);
        ww = ww+1;
    end
end

subplot(2,2,2)
imshow(logical(newwaterimage))
title("提取出的水印")

