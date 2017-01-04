function [ out, filter ] = addLight( in, M, N )

    % Summary - add extra light
    
    % choose light source
    imshow(in);
    [y, x] = ginput(1);
    x = floor(x);
    y = floor(y);
    close
    
    % generate light filter
    r = floor(N/10);
    n = floor(r/25);
    filter = zeros(M, N);
    filter = drawCircle(filter, x, y, r); 
    filter = imgaussfilt(filter, r/2);
    filter = drawLine(filter, x, y, n);
    filter = imgaussfilt(filter, r/10);
    
    % add light
    out = zeros(M, N);
    for i=1:M
        for j=1:N
            a = filter(i, j);
            out(i, j, 1) = a + (1-a)*in(i, j, 1);
            out(i, j, 2) = a + (1-a)*in(i, j, 2);
            out(i, j, 3) = a + (1-a)*in(i, j, 3);
        end
    end

end

