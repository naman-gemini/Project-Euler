# Building on logic provided here: https://www.mathblog.dk/project-euler-70-investigate-values-of-n-for-which-%CF%86n-is-a-permutation-of-n/
# Try to maximize denominator
# Try 1 prime factor (doesn't give a permutation as phi(n) = n - 1 if n is prime)
# Try 2 prime factors (phi(n) = (p1 - 1) * (p2 - 1) ; where p1 and p2 are the 2 prime factors)
# To even optimize, we know that each factor should be near sqrt(10^7) so let's search around it only

require 'prime'
MAX = 10_000_000
ROOT = Math.sqrt(MAX) # 3162

min_ratio = MAX
ans = 0

2000.upto(5000).each do |p1|
  (p1 + 1).upto(5000).each do |p2|
    if p1.prime? && p2.prime?
      n = p1 * p2
      next if n > MAX
      phi = (p1 - 1) * (p2 - 1)
      ratio = n.to_f / phi
      if n.to_s.chars.sort == phi.to_s.chars.sort && ratio < min_ratio
        ans = n
        min_ratio = ratio
      end
    end
  end
end

puts ans