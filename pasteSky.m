function output = pasteSky(input,sky,skyMask)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
[m,n,~] = size(input);
[m1,n1,~] = size(sky);
output = input;
LALPH = 0.5;
for i=1:m
    for j=1:n
        if skyMask(i,j) == 1
            output(i,j,:) = sky(mod(i,m1)+1,mod(j,n1)+1,:)*LALPH + input(i,j,:)*(1-LALPH);
        end
    end
end

figure;
imshow(output);
title('Step5: paste sky');
end

