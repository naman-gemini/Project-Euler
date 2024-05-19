# Approach: We can use modular arithmetic (a + b) % c = a % c + b % c to calculate last
# 9 digits. For the first 9 digits we can use the golden ratio (it's the approximate value).
# But the difference is in the end digits and not in the start (theoritically)
# So, from wikipedia, F(n) = phi^n / sqrt(5) ; where phi is the golden ratio
# => log(F(n)) = log(phi^n / sqrt(5)); log to the base 10
# => log(F(n)) = n * log(phi) - log(sqrt)
# Let's say, x = log(F(n))
# x.to_i => number of digits in F(n)
#
# To get first k digits of a number n = ((n / 10^number of digits in n) * 10^(k - 1)).to_i
# = ((10^logn / 10^number of digits in n) * 10^(k - 1)).to_i ; n = 10^log(n) where log(n) is to the base 10
# = 10^(log n - number of digits in n + k - 1).to_i
#
# First 9 digits of F(n) = 10^(log(F(n)) - number_of_digits(F(n)) + 9 - 1)
# = 10^(x - x.to_i + 8)
#
# Answer: 329468; Time: 2.101148 seconds

time = Time.now

MOD = 10**9
GOLDEN_RATIO = 1.618033988749895 #PHI (as accurate as we can get)
LOG_PHI = Math.log(GOLDEN_RATIO, 10)
LOG_SQRT_5 = Math.log(Math.sqrt(5), 10)

a = 1
b = 1

def pandigital?(num)
  num.chars.sort.join == (1..9).to_a.join
end

n = 3
loop do
  c = (a % MOD + b % MOD) % MOD
  a = b
  b = c
  unless pandigital?(c.to_s)
    n += 1
    next
  end

  x = n * LOG_PHI - LOG_SQRT_5
  first_9_digits = (10**(x - x.to_i + 8)).to_i

  if pandigital?(first_9_digits.to_s)
    puts n
    break
  end

  n += 1
end

puts "#{Time.now - time} seconds"