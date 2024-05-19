# Using Smarandache Function to calculate s(n). Reference: http://mathworld.wolfram.com/SmarandacheFunction.html
# Special case is explained here properly, and is not very clear in above reference: https://web.archive.org/web/20170222073259/http://www.gallup.unm.edu/~smarandache/Ashbacher-SmFu.pdf
#
# NOTE: This approach is just too slow as in this we have to prime factorize each number till 10**8

MAX = 100#10**8
require_relative 'euler'

$ans_cache = {}
$prime_factors = {}

class Integer
  def prime_division
    return $prime_factors[self] if $prime_factors.key?(self)
    # puts "Doing prime division for #{self}"
    factorization = {}
    n = self
    if n % 2 == 0
      factorization[2] = 0
      while n % 2 == 0
        factorization[2] += 1
        n /= 2
      end
    end
    i = 3
    while i <= n
      if $prime[i]
        if n % i == 0
          factorization[i] = 0
          while n % i == 0
            factorization[i] += 1
            n /= i
          end
        end
      end
      i += 2
    end
    $prime_factors[self] = factorization.to_a
  end
end

def calc_ans(start_number, p)
  sum = 0
  m = start_number
  loop do
    hold = m / p
    break if hold == 0
    sum += hold
    m = hold
  end
  start_number + sum
end

def solve_special_case(p, k)
  start_number = 1
  loop do
    ans = calc_ans(start_number, p)
    break if ans >= k
    start_number += 1
  end
  start_number * p
end

def solve(prime_division)
  return $ans_cache[prime_division] if $ans_cache.key?(prime_division)
  ans = if prime_division.count == 1
    # solve s(p^k)
    p = prime_division.first.first
    k = prime_division.first.last
    if k <= p
      p * k
    else
      solve_special_case(p, k)
    end
  else
    prime_division.map { |arr| solve([arr]) }.max
  end
  $ans_cache[prime_division] = ans
end

def s(n)
  return n if $prime[n]
  prime_division = n.prime_division
  solve(prime_division)
end

sieve
(2..MAX).each do |n|
  n.prime_division if !n.prime?
end

sum = 0
(2..100).each do |n|
  val = s(n)
  sum += val
  puts "s(#{n}) = #{val}"
end

puts sum