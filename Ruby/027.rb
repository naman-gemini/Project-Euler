MAX = 1_000_000
require_relative 'euler'

sieve

# n in [0, ]
# a in [-999, 999]
# b in primes

max = 0
ans = {}
i = 2
loop do
  if $prime[i]
    b = i
    break if b > 1000
    (-999).upto(999) do |a|
      cnt = 0
      n = 0
      loop do
        if $prime[n * n + a * n + b]
          cnt += 1
        else
          break
        end
        n += 1
      end
      if cnt > max
        max = cnt
        ans = {val: max, a: a, b: b}
      end
    end
  end
  i += 1
end

puts ans
puts ans[:a] * ans[:b]

# Code Golfing Solution:
#
# require 'mathn'
# puts (-999..999).to_a.product((-999..999).to_a).map { |a, b|
#   [(0..100).take_while { |n| (n**2 + a*n + b).prime? }.count, a * b]
# }.max[1]