function f1 = smfilt(f)
%图像平滑处理
g = (1/9)*[1,1,1;1,1,1;1,1,1];%此处为模板，可以更改
M = size(f,1);
N = size(f,2);
f1 = zeros(M,N);
for j = 1:max(N,M)
    f1(1,j) = f(1,j);
    f1(j,1) = f(j,1);
    f1(M,j) = f(M,j);
    f1(j,N) = f(j,N);
end
for i = 2:M-1
    for j  = 2:N-1
        f1(i,j) = g(1,1)*f(i-1,j-1)+g(1,2)*f(i-1,j)+g(1,3)*f(i,j+1)+g(2,1)*f(i,j-1)+...
            g(2,2)*f(i,j)+g(2,3)*f(i,j+1)+g(3,1)*f(i+1,j-1)+g(3,2)*f(i+1,j)+g(3,3)*f(i+1,j+1);
    end
end
figure()
imshow(uint8(f1))
