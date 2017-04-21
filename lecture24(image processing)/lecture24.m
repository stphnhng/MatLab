clear all; close all;

B = zeros(35000,40)
u = zeros(35000,1);
taylor_image = uint8(reshape(B(:,1),200,175));
imshow(taylor_image);


[U,S,V] = svd(A,'con');

