function x = congruentFinder(a, b, n)
    % finds x st a * x congruent to b mod n
    % get gcd and mult inverse of a mod n
    [g, inv, dummy] = gcd(a, n);
    % if a and n are coprime, mult b by a's mult inverse
    if isequal(1, g)
        % inv is negative, get positive congruent num
        if (inv < 0)
            inv = inv + n;
        end
        x = mod(inv * b, n);
    else
        % if gcd of a and n divides b, g sols
        if (rem(b, g) == 0)
            for i = 0: g - 1
                x = congruentFinder(a/g, b/g, n/g) + i * n/g;
            end
        else
            x = 'no solutions';
        end
    end    
end