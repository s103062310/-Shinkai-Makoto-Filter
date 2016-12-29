%% preparation
close all
clear all
clc

%% read image
src1 = imread('input10.jpg');
src2 = im2double(src1);
[M, N, C] = size(src1);

%% Step1: median filtering
blur = zeros(M, N, C);
blur(:,:,1) = medfilt2(src2(:,:,1));
blur(:,:,2) = medfilt2(src2(:,:,2));
blur(:,:,3) = medfilt2(src2(:,:,3));

%% Step2: sharpening
H = fspecial('laplacian', 1);
sharp = zeros(M, N, C);
sharp(:,:,3) = imfilter(blur(:,:,3), H);
sharp = blur - sharp*1.5;

%% Step3: soft light (hue, lightness, blur)
soft = rgb2hsv(sharp);
soft(:,:,2) = soft(:,:,2) - 0.01;
soft(:,:,3) = soft(:,:,3) + 0.15;
soft = hsv2rgb(soft);
soft = imgaussfilt(soft, 0.1);

%% show
figure
imshow(src2);
title('src');
figure
imshow(blur);
title('Step1: median filtering');
figure
imshow(sharp);
title('Step2: sharpening');
figure
imshow(soft);
title('Step3: soft light');

%% save
imwrite(blur, 'Step1_median_filtering.jpg');
imwrite(sharp, 'Step2_sharpening.jpg');
imwrite(soft, 'Step3_soft_light.jpg');
