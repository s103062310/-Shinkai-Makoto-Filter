function [ out ] = drawLine( in, x, y, n )

    % Summary - draw line on input image
    
    % preparation
    fprintf('\nDraw light line.\n');
    [M, N] = size(in);
    lineData = zeros(4*n, 3);
    count = 0;
    
    % random line data (angle, dis, length)
    p1 = randperm(90);
    p2 = randperm(floor(50*n));
    p3 = randperm(M);    
    for i=1:4*n
        lineData(i, 1) = (p1(i)+floor((i-1)/4)*90)*pi/180;
        lineData(i, 2) = p2(i);
        lineData(i, 3) = p3(i) + N;
        fprintf('%d: %d(%d) %d %d\n', i, lineData(i, 1), p1(i), lineData(i, 2), lineData(i, 3));
    end
    
    % draw line
    for i=1:M
        for j=1:N
            newx = i-x;
            newy = j-y;
            angle = atan(newy/newx);
            if(newx<0) angle = angle + pi;
            elseif(newy<0) angle = angle + 2*pi;
            end
            for k=1:4*n
                v = abs(angle-lineData(k, 1));
                if(v<0.01)
                    d = norm([newx, newy]-[0, 0]);
                    if(d>lineData(k, 2)&&d<lineData(k, 2)+lineData(k, 3))
                        in(i, j) = 1;
                        count = count + 1;
                    end
                    
                end
            end
        end 
    end
    out  = in;
    fprintf('%d %d count = %d\n', x, y, count);

end

