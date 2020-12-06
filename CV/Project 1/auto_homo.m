clf
clc
I1 = imread('01.png');
I2 = imread('02.png');
I3 = imread('03.png');
% I4 = imread('04.png');
% 
% I1 = imresize(I1,1,'bilinear');
% I2 = imresize(I2,1,'bilinear');
% I3 = imresize(I3,1,'bilinear');
% I4 = imresize(I4,1,'bilinear');
% 
% I1 = imrotate(I1,-90,'bilinear','crop');
% I2 = imrotate(I2,-90,'bilinear','crop');
% I3 = imrotate(I3,-90,'bilinear','crop');
% I4 = imrotate(I4,-90,'bilinear','crop');


H = [1 0 400; 0 1 100; 0 0 1];
tform = maketform('projective',H');
Base = imtransform(I2,tform,'nearest','xyscale',1,...
                'xdata', [1 2000], 'ydata', [1 1000],...
                'fillvalues', 0);

tform = auto(I1,Base);
Base_tmp = imtransform(I1,tform,'nearest','xyscale',1,...
                'xdata', [1 2000], 'ydata', [1 1000],...
                'fillvalues', 0);
            
Base = gra_proc(2, I1, I2, H1);

figure;
imshow(Base);

tform = auto(I3,Base);
Base_tmp = imtransform(I3,tform,'nearest','xyscale',1,...
                'xdata', [1 2000], 'ydata', [1 1000],...
                'fillvalues', 0);
            
Base = gra_proc(Base_tmp,Base);

figure;
imshow(Base);

tform = auto(I4,Base);
Base_tmp = imtransform(I4,tform,'nearest','xyscale',1,...
                'xdata', [1 2000], 'ydata', [1 1000],...
                'fillvalues', 0);
            
Base = gra_proc(Base_tmp,Base);

figure;
imshow(Base);