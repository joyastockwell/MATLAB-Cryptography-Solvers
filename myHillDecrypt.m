% decrypts a hill ciphertext by finding the cofactor matrix and dividing
% by the determinant of the encryption matrix, then multiplying the
% ciphertext vectors by that
% encrMatrix * ptext = ctext
% ptext = ctext * (1/det(encrMatrix)) * cofactor(encrMatrix)
function ptext = myHillDecrypt(encrMatrix, matrixDim, ctext);
    % get the decryption matrix and the number version of ctext
    cofac = det(encrMatrix) .* inv(encrMatrix);
    decMatrix = round(multInv(det(encrMatrix), 26) * cofac);
    %decMatrix = multInv(det(encrMatrix), 26) .* cofac(encrMatrix, matrixDim);
    %mod(decMatrix * encrMatrix, 26)
    ctextNum = text2int(ctext);
    % decrypt blocks of size dim
    ptextNum = zeros(1, length(ctext));
    % note that for loop needs to take steps of size dim,
    % or we'll end up decrypting a block starting at one, another at two,
    % another at 3, etc. isntead of consecutive blocks
    for i = 1: matrixDim: length(ctext)
        ptextNum(i: i + matrixDim - 1) = ctextNum(i: i + matrixDim - 1) * decMatrix;
    end
    ptext = int2text(mod(ptextNum, 26));
end