function [ out ] = adjustHSV( in )

    % Summary - adjust image light and saturation in HSV color space

    % auto parameter - s, v
    out = rgb2hsv(in);
    out(:,:,2) = out(:,:,2) + 0.2;
    out(:,:,3) = out(:,:,3) + 0.35;
    out = hsv2rgb(out);

end

