function preds = hw_test1a(params,test,testlabels)

% test = testdata
len = length(test);
fv = size(test);
fv = fv(2);
numClass = length(params);
plugStruct = struct();

for i = 1 : len
    for j = 1 : numClass
        plugInClassifier = ((params(j).pi)/det(sqrt(params(j).sigma)))...
            * exp( -1/2 * bsxfun(@minus,test(i,:),params(j).mu)) *...
            (params(j).sigma)^(-1)...
            * (transpose(bsxfun(@minus,test(i,:),params(j).mu)));
        plugInClass(j) = plugInClassifier;
        plugStruct(i).plug = plugInClass;
    end
    maxVal = max([plugStruct(i).plug]);
    predClass = find([plugStruct(i).plug] == maxVal);
    preds(i) = predClass;
end

preds = bsxfun(@minus, preds, 1);
preds = transpose(preds);
errorMat = eq(preds,testlabels);
testError = ((length(testlabels) - sum(errorMat))/length(testlabels))...
    *100



