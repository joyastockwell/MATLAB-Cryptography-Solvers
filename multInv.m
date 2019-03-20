function p = multInv(b, n)
    [g, a, dummy] = gcd(b, n);
    if isequal(1, g)
        if (a < 0)
            a = a + n;
        end
        p = a;
    else
        disp('error: b and n not coprime');
    end    
end