function  [H,d] = lhpfilter(type1,type2,m,n,d0,nn)
%nn：滤波器阶数
%type1:选择滤波器是高通还是低通；高通：high;低通：low
%type2:选择滤波器的类型：
%     Ideal:理想型
%     Butterworth:巴特沃斯性
%     Exponential:指数型
[u,v] = DXY(m,n);
d = sqrt(u.^2+v.^2);%计算距离
switch type1
    case 'low'%低通滤波器
        switch type2
            case 'Ideal' 
                H = double(d<=d0);%d中小于等于d0的元素为1；
            case 'Butterworth'
                H = 1./(1+(sqrt(2)-1).*(d./d0).^(2*nn));
            case 'Exponential'
                H = exp(log(1/sqrt(2)).*(d./d0).^(nn));
            otherwise
                error('请重新输入滤波器类型');
        end
    case 'high'%高通滤波器
        switch type2
            case 'Ideal' 
                H = double(d>d0);%d中大于d0的元素为1；
            case 'Butterworth'
                H = 1./(1+(sqrt(2)-1).*(d0./d).^(2*nn));
            case 'Exponential'
                H = exp(log(1/sqrt(2)).*(d0./d).^(nn));
            otherwise
                error('请重新输入滤波器类型');
        end
    otherwise
        error('请重新输入滤波器类型：‘high’or‘low’');
end

            
        