# MAX = 5_000
# pentagonal_numbers = {}
# (1..MAX).map{ |n| n * (3 * n - 1) / 2 }.each { |t| pentagonal_numbers[t] = true }

# diffs = []
# keys = pentagonal_numbers.keys
# keys.each do |a|
#   keys.each do |b|
#     diffs << (a - b).abs if !pentagonal_numbers[a + b].nil? && !pentagonal_numbers[(a - b).abs].nil?
#   end
# end
# puts diffs.min

require 'set'
pentagonals = (1..5000).map { |n| n * (3 * n - 1) / 2 }.to_set
puts pentagonals.to_a.combination(2).select { |a, b|
  pentagonals.include?(a + b) && pentagonals.include?((a - b).abs)
}.map { |a, b| (a - b).abs }.min