function   [g,r,q,m] =klt(X)
%g:The result of K-L transformation
%r:特征向量
%q:特征值
%m:X的列均值
M = size(X,1);
N = size(X,2);
m = (1/M)*sum(X,2);
L = zeros(M,M);
for i = 1:M
     L = L + X(:,i).*X(:,i)';
end
C = (1/M)*L - m.*m';
[p,q] = eig(C);
r = flip(p');%特征向量
q = flip(q);
q = fliplr(q);%特征值
g = r*(X-m);
