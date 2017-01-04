function [ out ] = drawCircle( in, x, y, r )

    % Summary - draw circle in input image

    % preparation
    fprintf('\nDraw light source.\n');
    [M, N] = size(in);
    count = 0;
    min = 5000;
    
    % draw
    for i=1:M
        for j=1:N
            dis = norm([i, j]-[x, y]);
            if(dis<min) min = dis;
            end
            if(dis<r)
                in(i, j) = 1;
                count = count + 1;
            end
        end
    end
    out = in;
    fprintf('%d %d %d count = %d / %d\n', x, y, r, count, min);
    
end

