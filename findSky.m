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
    J = bwlabel(erosion, 4);   %�|�s�q�е�
    STATS = regionprops(J, 'Area');
    allArea = [STATS.Area];   %�Φ��H���n�����������c��
    maxmium = max(allArea);   %�����n�̤j��
    L = length(allArea);
    for i=1:L
        if allArea(i)==maxmium
            index = i;
        end
    end
    skyMask = ismember(J,index);  %��X���n�̤j���е��ϰ�
    
end

