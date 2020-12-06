clf
clc
close all;
n=10;
I1 = imread('01.png');
I2 = imread('02.png');
% 
% I1 = imresize(I1,0.27,'bilinear');
% I2 = imresize(I2,0.27,'bilinear');
% 
% I1 = imrotate(I1,-90,'bilinear');
% I2 = imrotate(I2,-90,'bilinear');

H = [1 0 0; 0 1 0; 0 0 1];
tform1 = maketform('projective',H');
Base = imtransform(I2,tform1);

imshow(Base);
title('Mark the 10 destination points');
P1_Base = ginput(n);
hold on;
scatter(P1_Base(:,1),P1_Base(:,2));
hold off;

figure;
imshow(I1);
title('Mark the 10 destination points')
P1 = ginput(n);
hold on;
scatter(P1(:,1),P1(:,2));
hold off;
figure;

H1 = Compute_H(P1,P1_Base); 
tform2 = maketform('projective',H');

tf = projective2d(H);
tf1 = projective2d(H1);

gra_proc(2, I1, I2, H1);