function pcaData2=PCA1(k,X)
%kΪ���ɷָ�����XΪԭʼ���ݣ���Ϊ��������Ϊ����
% xmax=max(X);
% X1=X./xmax;%ԭʼ���ݱ�׼������
X1=zscore(X);
X1(:,2:3)=-X1(:,2:3);%���򻯴���
[Row ,Col]=size(X1);
covX=cov(X1);                                    %��������Э�������ɢ���������(n-1)��ΪЭ�������
[V ,D]=eigs(covX);                               %��Э������������ֵD����������V
meanX=mean(X1);                                  %������ֵm
%��������X��ȥ������ֵm���ٳ���Э�������ɢ�����󣩵���������V����Ϊ���������ɷ�SCORE
tempX= repmat(meanX,Row,1);
SCORE2=(X1-tempX)*V;                             %���ɷݣ�SCORE
pcaData2=SCORE2(:,1:k);
end