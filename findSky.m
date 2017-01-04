function [ skyMask, I, dilate, erosion ] = findSky( input )

    % Summary - find sky part in image
    
    % threshold to blue space
    I = input(:, :, 3);
    I = imbinarize(I, 0.7);

    % do dilation -> erosion
    sq = ones(3, 3);
    dilate = imdilate(I, sq);
    erosion = imerode(dilate, sq);

    % choose the biggest part as sky
    J = bwlabel(erosion, 4);   %四連通標註
    STATS = regionprops(J, 'Area');
    allArea = [STATS.Area];   %形成以面積為元素的結構體
    maxmium = max(allArea);   %取面積最大值
    L = length(allArea);
    for i=1:L
        if allArea(i)==maxmium
            index = i;
        end
    end
    skyMask = ismember(J,index);  %找出面積最大的標註區域
    
end

