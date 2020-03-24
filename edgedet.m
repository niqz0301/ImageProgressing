close all;clear all;
g = [0,-1,0;-1,5,-1;0,-1,0]
f = double(rgb2gray((imread('zhengzhu.jpg'))));%必须用double
M = size(f,1);
N = size(f,2);
f1 = zeros(M,N);
% for j = 1:max(N,M)
%     f1(1,j) = f(1,j);
%     f1(j,1) = f(j,1);
%     f1(M,j) = f(M,j);
%     f1(j,N) = f(j,N);
% end

for i = 2:M-1
    for j  = 2:N-1
         f1(i,j) = g(1,1)*f(i-1,j-1)+g(1,2)*f(i-1,j)+g(1,3)*f(i,j+1)+g(2,1)*f(i,j-1)+...
         g(2,2)*f(i,j)+g(2,3)*f(i,j+1)+g(3,1)*f(i+1,j-1)+g(3,2)*f(i+1,j)+g(3,3)*f(i+1,j+1);
        f1(i,j) = 4*f(i,j)-f(i-1,j)-f(i,j-1)-f(i,j+1)-f(i+1,j);
    end
end

figure()
imshow(uint8(f1));

f2 = imfilter(f,g,'symmetric','conv');
figure()
imshow(uint8(f2))

f3 = edge(f,'roberts');
figure()
imshow(f3)
f4 = double(f)+double(f3);
figure()
imshow(uint8(f4))

f5 = medianfilt(f2,3);
figure()
imshow(uint8(f5))


