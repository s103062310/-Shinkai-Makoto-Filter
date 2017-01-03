function [ out ] = addLight( in, F, M, N )

    % Summary - add extra light
    
    % preparation
    out = zeros(M, N);
    
    % add light
    for i=1:M
        for j=1:N
            a = F(i, j);
            out(i, j, 1) = a + (1-a)*in(i, j, 1);
            out(i, j, 2) = a + (1-a)*in(i, j, 2);
            out(i, j, 3) = a + (1-a)*in(i, j, 3);
        end
    end

end

