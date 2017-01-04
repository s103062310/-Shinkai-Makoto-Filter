%% preparation
close all
clear all
clc

%% read image
fprintf('Shinkai Makoto Filter START!\nRead image.\n');
src1 = imread('input/input5.jpg');
src2 = im2double(src1);
[M, N, C] = size(src1);
target = imread('guide/guide10.jpg');
target = im2double(target);

%% Step1: median filtering
fprintf('\nStep1: median filtering\n');
blur = changeStyle(src2, M*N);

%% Step2: color transfer (guide)
fprintf('\nStep2: color transfer\n');
color = cf_reinhard(blur, target);

%% Step3: adjust (saturation, brightness)
fprintf('\nStep3: adjust\n');
adjust = adjustHSV(color);

%% Step4: add light (light source)
fprintf('\nStep4: add light\n');
[light, light_filter] = addLight(adjust, M, N);

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
title('Step2: color transform');
figure
imshow(adjust);
title('Step3: adjust');
figure
imshow(light_filter)
title('light filter');
figure
imshow(light)
title('Step4: add light');

%% save
imwrite(blur, 'Step1_median_filtering.jpg');
imwrite(color, 'Step2_color_transfer.jpg');
imwrite(adjust, 'Step3_adjust.jpg');
imwrite(light_filter, 'light_filter.jpg');
imwrite(light, 'Step4_add_light.jpg');
