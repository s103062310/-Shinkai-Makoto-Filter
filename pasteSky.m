function [ output ] = pasteSky( input, sky, skyMask )
    
    % Summary - paste shinkai makoto style sky
    
    % preparation
    [m,n,~] = size(input);
    [m1,n1,~] = size(sky);
    [m2,n2,~] = size(skyMask);
    output = input;
    LALPH = 0.5;
    
    % paste
    for i=1:m2
        if (max(skyMask(i,:)==1))
            a1 = i;
            break;
        end
    end
    for i=m2:-1:1
        if (max(skyMask(i,:)==1))
            a2 = i;
            break;
        end
    end
    for j=1:n2
        if (max(skyMask(:,j)==1))
            b1 = j;
            break;
        end
    end
    for j=n2:-1:1
        if (max(skyMask(:,j)==1))
            b2 = j;
            break;
        end
    end
    theta = 0;scale = max((a2-a1)/m1,(b2-b1)/n1);
    tform = affine2d([scale*cosd(theta) -scale*sind(theta) 0; scale*sind(theta) scale*cosd(theta) 0; 0 0 1]);
    sky = imwarp(sky,tform);
    [m1,n1,~] = size(sky);
    for i=1:m
        for j=1:n
            if skyMask(i,j) == 1
                output(i,j,:) = sky(mod(i,m1)+1,mod(j,n1)+1,:)*LALPH + input(i,j,:)*(1-LALPH);
            end
        end
    end
    
end

