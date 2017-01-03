%% preparation
close all
clear all
clc

%% read image
src1 = imread('input/input1.jpg');
src2 = im2double(src1);
[M, N, C] = size(src1);

%% Step1: median filtering - choose filter size by image size
if(M*N<2000000) s = 3;
else s = 5;
end
blur = zeros(M, N, C);
blur(:,:,1) = ordfilt2(src2(:,:,1), 5, ones(s, s));
blur(:,:,2) = ordfilt2(src2(:,:,2), 5, ones(s, s));
blur(:,:,3) = ordfilt2(src2(:,:,3), 5, ones(s, s));

%% Step2: color transform
target = imread('guide/guide10.jpg');
target = im2double(target);
color = cf_reinhard(blur, target);

%% Step3: adjust (hue, lightness, blur)
soft = rgb2hsv(color);
soft(:,:,2) = soft(:,:,2) + 0.2;
soft(:,:,3) = soft(:,:,3) + 0.35;
soft = hsv2rgb(soft);

%% Setp4: choose light source
imshow(src1);
[y, x] = ginput(1);
x = floor(x);
y = floor(y);
close

%% Step5: generate light filter (n)
r = floor(N/10);
n = floor(M/100);
light_f = zeros(M, N);
light_f = circle(light_f, x, y, r);
%light_f = line(light_f, x, y, n);
light_f = imgaussfilt(light_f, r/2);

%% Step6: add light
light = addLight(soft, light_f, M, N);

%% show
figure
imshow(src2);
title('src');
figure
imshow(blur);
title('Step1: median filtering');
figure
imshow(target)
title('guide');
figure
imshow(color);
title('color');
figure

%%
imshow(soft);
title('Step3: soft light');
figure
imshow(light_f)
title('light filter');
figure
imshow(light)
title('light');
