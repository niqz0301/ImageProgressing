function [u,v] = DXY(m,n)
%计算矩阵元素到原点的距离
u = 0:m-1;
v = 0:n-1;
idx = find(u>m/2);
u(idx) = u(idx)-m;
idy = find(v>n/2);
v(idy) = v(idy)-n;

[v,u] = meshgrid(v,u);