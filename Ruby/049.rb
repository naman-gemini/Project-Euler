require 'prime'
MAX = 9_999
primes = (999..MAX).select { |n| n.prime? }

puts primes.select { |p| x = p.to_s.chars.permutation.to_a.uniq.select {
  |pr| pr.join.to_i.prime? && pr.join.to_i.to_s.size == 4 }.map {
    |t| t.join.to_i }.combination(3).map(&:sort).
      select { |a, b, c| b - a == c - b }
      x.flatten.include?(p) && x.flatten.size == 3 }.reject {|p| p.to_s.chars.sort.join == "1478" }.join