function params = hw_train1b(X,Y)

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
    params(i).sigma = eye;
    meanMu = mean(X1);
    params(i).mu = meanMu;
    
    %for j = 1 : fv
     %   mu(i,j) = X1(1,j);
    %end
end