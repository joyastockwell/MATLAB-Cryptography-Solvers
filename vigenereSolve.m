function key = vigenereSolve(text)
    k = keyLength(text);
    % vector we'll use to store shifts
    shifts = zeros(k, 1);
    % get the groups of letters with the same ind mod k, for each group...
    len = length(text);
    for j = 1: k
        % get the frequency score for each possible shift and store the
        % shift that has the best score
        [trash, ind] = max(corr(vigvec(text, k, j)));
        % correct off-by-one b/c first shift is by zero
        shifts(j, 1) = ind - 1;
    end
    % encryption key is inverse of decryption key
    key = -1 * shifts
    % apply the shifts to the ciphertext to get the plaintext back
    disp(vigenere(text, key))
end

function z = keyLength(text)
    % shift text by s and count coincidences, storing answers in vec
    vec = zeros(length(text), 1);
    for s = 1: length(text)
        vec(s, 1) = coinc(text, s);
    end
    % the index of the maximum is the length of the key
    [trash, ind] = max(vec);
    % disp(vec)
    z = ind;
end