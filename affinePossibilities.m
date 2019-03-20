function y = affinePossibilities(text)
% put the frequency score, the encryption alphas and betas, and
% the decryption alphas and betas into a  matrix
    decryptions = zeros(312, 5);
    % values alpha can take on
    alphaVals = [1, 3, 5, 7, 9, 11, 15, 17, 19, 21, 23, 25];
    % the row in which we will put our answers
    rowInd = 1;
    % for all possible combinations of alpha and beta
    for beta = 1: 26
        for alphaInd = 1: 12
            % get text decrypted using (alpha, beta) as decryption key;
            
            % get the frequency score by dotting the English frequency
            % vector with a frequency vector from the current decryption
            fEng= [.082 .015 .028 .043 .127 .022 .020 .061 .070 .002 ...
      .008 .040 .024 .067 .075 .019 .001 .060 .063 .091 ...
      .028 .010 .023 .001 .020 .001];
            fText = frequency(affinecrypt(text, alphaVals(alphaInd), beta));
            dotproduct = dot(fEng, fText);
            decryptions(rowInd, 1) = dotproduct;
            % get alpha's multiplicative inverse: the encryption alpha
            decryptions(rowInd, 2) = multInv(alphaVals(alphaInd), 26);
            % get beta's additive inverse: the encryption beta
            decryptions(rowInd, 3) = multInv(alphaVals(alphaInd), 26) * (26 - beta);
            % store alpha and beta
            decryptions(rowInd, 4) = alphaVals(alphaInd);
            decryptions(rowInd, 5) = beta;
            % increment the index
            rowInd = rowInd + 1;
        end 
    end
    sorted = sortrows(decryptions);
    % print 10 decryptions with best frequency score
    for i = 302:312
        disp(affinecrypt(text, sorted(i, 4), sorted(i, 5)));
        disp(sorted(i, 2));
        disp(sorted(i, 3));
    end
end