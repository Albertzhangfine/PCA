function pcaData2=PCA1(k,X)
%k为主成分个数；X为原始数据，行为变量，列为样本
% xmax=max(X);
% X1=X./xmax;%原始数据标准化处理
X1=zscore(X);
X1(:,2:3)=-X1(:,2:3);%正向化处理
[Row ,Col]=size(X1);
covX=cov(X1);                                    %求样本的协方差矩阵（散步矩阵除以(n-1)即为协方差矩阵）
[V ,D]=eigs(covX);                               %求协方差矩阵的特征值D和特征向量V
meanX=mean(X1);                                  %样本均值m
%所有样本X减去样本均值m，再乘以协方差矩阵（散步矩阵）的特征向量V，即为样本的主成份SCORE
tempX= repmat(meanX,Row,1);
SCORE2=(X1-tempX)*V;                             %主成份：SCORE
pcaData2=SCORE2(:,1:k);
end