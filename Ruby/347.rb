MAX = 10_000_000
require_relative 'euler'

def solve(p, q)
  max_product = 0
  product = p * q

  while product <= MAX do
    current = product
    # maximise q's exponent
    while current * q <= MAX do
      current *= q
    end
    max_product = current if current > max_product
    # Move on to next p's exponent
    product *= p
  end

  max_product
end

sieve
sum = 0

p = 2
(2..MAX).each do |p|
  break if p * p > MAX
  next unless p.prime?
  q_start = p == 2 ? 3 : p + 2 # 2 -> 3 only exception case
  (q_start..MAX).each do |q|
    break if p * q > MAX
    next unless q.prime?
    # puts "Solving for p = #{p}, q = #{q}"
    sum += solve(p, q)
  end
end

puts sum