%% preparation
close all
clear all
clc

%% read image
fprintf('Shinkai Makoto Filter START!\nRead image.\n');
src = im2double(imread('input/input5.jpg'));
target = im2double(imread('guide/guide10.jpg'));
sky = im2double(imread('sky.jpg'));
[M, N, C] = size(src);

%% Step1: median filtering
fprintf('\nStep1: median filtering\n');
blur = changeStyle(src, M*N);

%% Step2: color transfer (guide)
fprintf('\nStep2: color transfer\n');
color = cf_reinhard(blur, target);

%% Step3: adjust (saturation, brightness)
fprintf('\nStep3: adjust\n');
adjust = adjustHSV(color);

%% Step4: paste sky (sky)
fprintf('\nStep4: paste sky\n');
changeSky = pasteSky(adjust, sky, findSky(src));

%% Step5: add light (light source)
fprintf('\nStep5: add light\n');
[light, light_filter] = addLight(src, changeSky, M, N);

%% show
figure
imshow(src);
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
imshow(changeSky);
title('Step4: paste sky');
figure
imshow(light_filter)
title('light filter');
figure
imshow(light)
title('Step5: add light');

%% save
imwrite(blur, 'Step1_median_filtering.jpg');
imwrite(color, 'Step2_color_transfer.jpg');
imwrite(adjust, 'Step3_adjust.jpg');
imwrite(changeSky, 'Step4_paste_sky.jpg');
imwrite(light_filter, 'light_filter.jpg');
imwrite(light, 'Step5_add_light.jpg');
