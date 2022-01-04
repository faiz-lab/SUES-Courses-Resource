[signal,fs]=audioread('..../你的音频文件.wav');
signal = signal(:, 1);
framelength=512;
framenumber=fix(length(signal)/framelength);
M=15;
Y(1:2*framelength)=signal((M-1)*framelength+1: (M+1)*framelength);

% 分帧处理
for i = 1:framenumber;
    framesignal(i, 1:framelength) = signal((i-1)*framelength+1:i*framelength);
end

for i = 1:framenumber;
    E(i) = 0;
    E(i) = sum(framesignal(i,:).^2);
end

% 获取浊音帧
number = 0;
averE = sum(E) / length(E);     % 计算平均能量
T = averE;                      % 设置阈值
for i = 1:framenumber;
    if(E(i)>=T)                 % 大于阈值为浊音帧
        number = number + 1;
        voiceE(number) = i;
    end
end

diffE = diff(voiceE);           

flag = 1;
voiceframe = voiceE(1);
N = 0;

while(flag);
    for i = 1:length(diffE) - 1;
        if(diffE(i) == 1)
            N = N + 1;
            if (N == 3)      % 连续3帧满足浊音 -> 为浊音段
                flag = 0;
            end
        elseif (diffE(i)~=1)
                voiceframe = voiceE(i+1);
            end
        end
end

startpoint = (voiceframe - 1) * framelength + 1;
endpoint = (voiceframe + 1) * framelength;

Selectsignal = signal(startpoint:endpoint);

subplot(4,1,1)
plot(Selectsignal(1:length(Selectsignal)/2))
title("提取的浊音信号波形")

T = 0.5 * max(Selectsignal);    % 最大幅值的50%作为削波电平
% 中心削波
for i = 1:length(Selectsignal)
    if(Selectsignal(i) > T)
        Selectsignal(i) = Selectsignal(i) - T;
    elseif(Selectsignal(i) < -T)
        Selectsignal(i) = Selectsignal(i) + T;
    else
        Selectsignal(i) = 0;
    end
end
subplot(4,1,2)
plot(Selectsignal(1:length(Selectsignal)/2))
title("中心削波后波形")

% 三电平削波
for i = 1:length(Selectsignal)
    if(Selectsignal(i)>0)
        Selectsignal(i) = 1;
    elseif (Selectsignal(i)<0)
        Selectsignal(i) = -1;
    else
        Selectsignal(i) = 0;
    end
end

subplot(4, 1, 3)
plot(Selectsignal(1:length(Selectsignal)/2))
title("三电平削波后波形")

% 自相关计算
framelength = length(Selectsignal) / 2;
for i = 1:framelength;
    R(i) = 0;
    for j = 1:framelength;
        R(i) = R(i) + Selectsignal(j) * Selectsignal(i+j);
    end
end

subplot(4, 1, 4)
plot(R);
title("削波后的修正自相关函数");


[yvalue,xvalue]=max(R(20:length(R)));
pitchperiod = xvalue + 19;      % 基音周期
Pitchvalue=fs/pitchperiod;      % 基音频率
if (Pitchvalue>0 && Pitchvalue<200)
    result = '男'
else
    result = '女'
end

        


