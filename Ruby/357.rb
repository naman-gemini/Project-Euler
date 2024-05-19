MAX = 100_000_000
require_relative 'euler'
# Brute force solution clearly won't work with such large range. We have to prune some numbers
# d + n / d has to be prime
# Every number has a divisor as 1 => 1 + n should be prime => n should be even
# Because n is even, d has to have a value as 2 => 2 + n / 2 should be prime => n / 2 should be odd

sieve

# Check for all divisors. We have already checked for 1
def check?(n)
  i = 2
  while i * i <= n
    return false if n % i == 0 && !(i + n / i).prime?
    i += 1
  end
  true
end

sum = 3 # 1 and 2 follow the rule
(4..MAX).step(2).each do |n|
  next if !(n + 1).prime? # n + 1 should be prime
  next if n % 4 == 0 # n / 2 should be odd
  sum += n if check?(n)
end
puts sum