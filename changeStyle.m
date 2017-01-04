function [ out ] = changeStyle( in, pixel )

    % Summary - use median filtering change image style
    
    % decide filter size
    if(pixel<2000000) s = 3;
    else s = 5;
    end
    
    % median filtering
    out(:,:,1) = ordfilt2(in(:,:,1), 5, ones(s, s));
    out(:,:,2) = ordfilt2(in(:,:,2), 5, ones(s, s));
    out(:,:,3) = ordfilt2(in(:,:,3), 5, ones(s, s));

end

