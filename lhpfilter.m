function  [H,d] = lhpfilter(type1,type2,m,n,d0,nn)
%nn���˲�������
%type1:ѡ���˲����Ǹ�ͨ���ǵ�ͨ����ͨ��high;��ͨ��low
%type2:ѡ���˲��������ͣ�
%     Ideal:������
%     Butterworth:������˹��
%     Exponential:ָ����
[u,v] = DXY(m,n);
d = sqrt(u.^2+v.^2);%�������
switch type1
    case 'low'%��ͨ�˲���
        switch type2
            case 'Ideal' 
                H = double(d<=d0);%d��С�ڵ���d0��Ԫ��Ϊ1��
            case 'Butterworth'
                H = 1./(1+(sqrt(2)-1).*(d./d0).^(2*nn));
            case 'Exponential'
                H = exp(log(1/sqrt(2)).*(d./d0).^(nn));
            otherwise
                error('�����������˲�������');
        end
    case 'high'%��ͨ�˲���
        switch type2
            case 'Ideal' 
                H = double(d>d0);%d�д���d0��Ԫ��Ϊ1��
            case 'Butterworth'
                H = 1./(1+(sqrt(2)-1).*(d0./d).^(2*nn));
            case 'Exponential'
                H = exp(log(1/sqrt(2)).*(d0./d).^(nn));
            otherwise
                error('�����������˲�������');
        end
    otherwise
        error('�����������˲������ͣ���high��or��low��');
end

            
        