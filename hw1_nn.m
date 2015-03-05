function preds = hw1_nn(X,Y,test,testlabels)

n = [1000 2000 4000 8000];

for i = 1:4
    i
    for rep = 1:10
        rep
        [Xdata, ind] = datasample(X, n(i));
        for j = 1 : length(ind)
            Ydata(j) = Y(ind(j));
        end
        sizeTest = size(test);
        testLen = sizeTest(1);
        testFeat = sizeTest(2);
        % Xdata, Ydata, test
        for k = 1 : testLen
            x_euc = bsxfun(@minus, Xdata, test(k,:));
            x_euc_final = (x_euc).^2;
            for l = 1 : n(i)
                euclidD = sum(x_euc_final(l,:)); %removing sqrt as it doesnt matter
                euc(l) = euclidD;
            end
            x_euc_final_min = (min(euc));
            indEuc = find(euc == x_euc_final_min,1);
            preds(k,1) = Ydata(indEuc);
        end
        errorMat = eq(preds,testlabels);
        testError(rep) = length(preds) - sum(errorMat);
    end
    meanTestError(i) = mean(testError);
    stdTestError(i) = var(testError);
end

title('Mean Test Error')
errorbar(n,meanTestError,stdTestError)

             
        
   
        