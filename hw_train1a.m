function params = hw_train1a(X,Y)

%Input

%X = data;
%fv = size(X);
%fv = fv(2);
%Y = labels;

% labels
uniqueLabels = unique(Y);
len = length(uniqueLabels);


%MLE

params = struct();

total = length(Y);

%Estimation of mu
% mu = 1/N (Sum of all from i = 1 to n (x_i))
% µ = E(X)

for i = 1 : len
    class = uniqueLabels(i);
    params(i).pi = histc(Y,class)/total;
    X1 = X(Y == class,:);
    covX = cov(X1);
    params(i).sigma = covX;
    meanMu = mean(X1);
    params(i).mu = meanMu;
    
    %for j = 1 : fv
     %   mu(i,j) = X1(1,j);
    %end
end
%length(params)
% for i = 1: len
%     params(i).pi
%     params(i).mu
%     params(i).sigma
% end
%Estimation of sigma
% ? = 1/N (Sum of all from 1 to n(x_n ? µ?)*(x_n ? µ?)^T
% ? = Cov(X) = E[(X ? µ)(X ? µ)^T]