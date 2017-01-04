function skyMask = findSky(input)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
%I = imread(input);
I = input;
I = I(:,:,3);
I = imbinarize(I,0.7);

im = I;
sq = ones(3, 3);
dilate = imdilate(im, sq);
erosion = imerode(dilate, sq);
I = erosion;

J=bwlabel(I,4);%�|�s�q�е�
STATS=regionprops(J,'Area');
allArea=[STATS.Area];%�Φ��H���n�����������c��
maxmium=max(allArea);%�����n�̤j��
L=length(allArea);
for i=1:L
    if allArea(i)==maxmium
        index=i;
    end
end
skyMask=ismember(J,index);%��X���n�̤j���е��ϰ�

figure;
imshow(dilate);
title('Step4.1: Dilation');
figure;
imshow(erosion);
title('Step4.2: Erosion');
figure;
imshow(skyMask);
title('Step4.3: sky mask');
end

