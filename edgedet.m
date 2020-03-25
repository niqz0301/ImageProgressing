function f1 = edgedet(f,g)
%ͼ���Ե��ȡ���񻯣�����,gΪ3x3ģ��
%g = [0,-1,0;-1,5,-1;0,-1,0]ģ�壬�ɸı�

f = double(f);%������double
M = size(f,1);
N = size(f,2);
f1 = zeros(M,N);

for i = 2:M-1
    for j  = 2:N-1
         f1(i,j) = g(1,1)*f(i-1,j-1)+g(1,2)*f(i-1,j)+g(1,3)*f(i,j+1)+g(2,1)*f(i,j-1)+...
         g(2,2)*f(i,j)+g(2,3)*f(i,j+1)+g(3,1)*f(i+1,j-1)+g(3,2)*f(i+1,j)+g(3,3)*f(i+1,j+1);
       % f1(i,j) = 4*f(i,j)-f(i-1,j)-f(i,j-1)-f(i,j+1)-f(i+1,j);
    end
end

figure()
imshow(uint8(f1));

