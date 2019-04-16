function x = lastDigs(digits, base, pow)
    phi = eulerphi(pow);
    total = 1;
    % reduce after every step until you've multiplied the base by itself
    % phi times
    for i = 0:phi
        total = mod(base * total, 10^digits);
    end
    x = total;
end