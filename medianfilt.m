function  f1 = medianfilt(f,p)
%中值滤波函数，f:待处理图像，p:模板大小，取奇数
M = size(f,1);
N = size(f,2);
f1 = zeros(M,N);
for i = ((1+p)/2):(M+1-((1+p)/2))
    for j  = ((1+p)/2):(N+1-((1+p)/2))
        f1(i,j) = median(sort(reshape(f(i-(p-1)/2:(i-(p-1)/2+p-1),j-(p-1)/2:(j-(p-1)/2+p-1)),1,p^2)));
       % median(sort([f(i,j),f(i-1,j-1),f(i-1,j),f(i-1,j+1),f(i,j-1),f(i,j+1),f(i+1,j-1)+f(i+1,j),f(i+1,j+1)]));
    end
end
        
