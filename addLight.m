function [ out, filter ] = addLight( src, in, M, N )

    % Summary - add extra light
    
    % choose light source
    imshow(src);
    [y, x] = ginput(1);
    x = floor(x);
    y = floor(y);
    close
    if x<0 || x>M || y<0 || y>N
        if x>M/2
            mode = 2;
        else
            mode = 1;
        end
    else mode = 0;
    end
    
    % generate light filter
    filter = zeros(M, N);
    r = floor(N/10);
    n = floor(r/25);
    if mode==0
        filter = drawCircle(filter, x, y, r); 
        filter = imgaussfilt(filter, r/2);
        filter = drawRadixLine(filter, x, y, n);
        filter = imgaussfilt(filter, r/10);
    elseif mode==1
        deltax = x - M;
        deltay = y - N/2;
        angle = atan(deltay/deltax);
        filter = drawParallelLine(filter, angle, n*2);
        filter = imgaussfilt(filter, r/20);
    end
    
    % add light
    out = zeros(M, N, 3);
    if mode<2
        for i=1:M
            for j=1:N
                a = filter(i, j);
                out(i, j, 1) = a + (1-a)*in(i, j, 1);
                out(i, j, 2) = a + (1-a)*in(i, j, 2);
                out(i, j, 3) = a + (1-a)*in(i, j, 3);
            end
        end
    else out = in;
    end

end

