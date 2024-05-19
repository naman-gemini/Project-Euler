require 'Set'

numbers = Set.new

(2..100).each do |a|
  (2..100).each do |b|
    numbers << a ** b
  end
end

puts numbers.count

# code golfing
# puts (2..100).to_a.product((2..100).to_a).map { |a,n| a ** n }.uniq.count