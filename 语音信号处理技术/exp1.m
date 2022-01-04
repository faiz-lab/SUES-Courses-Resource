clc
clear

[x,fs]=audioread('...../你的音频文件.wav');
x = x(:, 1);
framelength=512;   % 越大越平滑
framenumber=fix(length(x)/framelength);

% 计算短时能量
for i=1:framenumber;
   E(i)=0;
   for j=(framelength*(i-1)+1):1:framelength*(i);
       E(i)=E(i)+x(j) ^2;  
   end;  
end;

totaltime=length(x)/fs;
for i=1:length(x);
    pointtime(i)=totaltime*i/length(x);
end
for i=1:framenumber;
    frametime(i)=totaltime*i/framenumber;
end

subplot(3,1,1)
plot(pointtime,x);
title("原始声音波形")

subplot(3,1,2)
plot(frametime,E);
MeanE = mean(E(1:10));
VarE  = std(E(1:10));
ET = MeanE + VarE;
% 10*ET为阈值，画线
line([0 totaltime], [10*ET 10*ET],'color','g','LineWidth',1);
title("语音短时能量")

% 画分界线
flag = 0;   % 向上穿过阈值，向下穿过阈值 标志
lineset = -1;
for i=1:framenumber;
    if (E(i) > 10*ET && flag == 0)  % 向上穿过阈值，为起点
        line([frametime(i) frametime(i)], [0 max(E)],'color','r','LineWidth',2);
        lineset = [lineset frametime(i)];        % 分界线x保留, 供下次画线
        flag = 1;
    end
    if (E(i) < 10*ET && flag == 1)  % 向下穿过阈值，为终点
        line([frametime(i) frametime(i)], [0 max(E)],'color','r','LineWidth',2);
        lineset = [lineset frametime(i)];
        flag = 0; 
    end
end
lineset = lineset(2:end);

subplot(3,1,3)
plot(pointtime,x);

% 画分界线
for i=1:length(lineset);
    line([lineset(i) lineset(i)], [-max(x)-0.5 max(x)+0.5],'color','r','LineWidth',2);
end
title("识别后声音波形")


