# summation(an) mod x = (a1 mod x + a2 mod x + a3 mod x + ... + an mod x) mod x
# i.e (a + b) mod x = (a % x + b % x) % x

MOD = 10**10

def modular_pow(base, exponent)
  result = 1
  while exponent > 0 do
    if exponent & 1 == 1
      result = (result * base) % MOD
    end
    exponent = exponent >> 1 # divide by 2
    base = (base * base) % MOD
  end
  result
end

puts (1..1000).inject{ |sum, n| (sum + modular_pow(n, n)) % MOD}