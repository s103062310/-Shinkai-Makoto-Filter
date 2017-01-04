function [ light ] = ShinkaiMakotoFilter( src, target, sky )

    % Summary - function version
    
    % preparation
    [M, N, C] = size(src);

    % Step1: median filtering
    fprintf('\nStep1: median filtering\n');
    blur = changeStyle(src, M*N);

    % Step2: color transfer (guide)
    fprintf('\nStep2: color transfer\n');
    color = cf_reinhard(blur, target);

    % Step3: adjust (saturation, brightness)
    fprintf('\nStep3: adjust\n');
    adjust = adjustHSV(color);

    % Step4: paste sky (sky)
    fprintf('\nStep4: paste sky\n');
    [skyMask, mask_threshold, mask_dilate, mask_erode] = findSky(src);
    changeSky = pasteSky(adjust, sky, skyMask);

    % Step5: add light (light source)
    fprintf('\nStep5: add light\n');
    [light, light_filter] = addLight(src, changeSky, M, N);

    % show
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
    figure;
    imshow(mask_threshold);
    title('Step4-1: threshold');
    figure;
    imshow(mask_dilate);
    title('Step4-2: dilation');
    figure;
    imshow(mask_erode);
    title('Step4-3: erosion');
    figure;
    imshow(skyMask);
    title('Step4-3: sky mask');
    figure
    imshow(changeSky);
    title('Step4: paste sky');
    figure
    imshow(light_filter)
    title('light filter');
    figure
    imshow(light)
    title('Step5: add light');

end

