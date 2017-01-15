function [ out ] = drawParallelLine( in, angle, n )

    % Summary - draw parallel line one the image

    % random line data
    [M, N] = size(in);
    lineData = zeros(n, 3);
    p1 = randperm(M);
    p2 = randperm(N);
    p3 = randperm(floor(M/2));
    for i=1:n
        lineData(i, 1) = p1(i);
        lineData(i, 2) = p2(i);
        lineData(i, 3) = p3(i);
        fprintf('%d: %d %d %d\n', i, lineData(i, 1), lineData(i, 2), lineData(i, 3));
    end
    
    % draw line
    c = floor(N/150);
    b = 1;
    if angle<0 b=-1; end
    for i=1:M
        for j=1:N
            for k=1:n
                for l=1:c
                    deltax = i - (lineData(k, 1)-l);
                    deltay = j - (lineData(k, 2)+l*b);
                    thita = atan(deltay/deltax);
                    if norm(thita-angle)<0.01 &&  norm([i, j]-[(lineData(k, 1)-l), (lineData(k, 2)+l)])<lineData(k, 3)
                        in(i, j) = 1;
                    end
                end
            end
        end
    end
    out = in;

end

