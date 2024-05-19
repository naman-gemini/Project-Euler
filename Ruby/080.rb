# Using Newton's method to find square root (https://en.wikipedia.org/wiki/Newton%27s_method#Pseudocode)

require 'bigdecimal'
TOLERANCE = 10 ** -100
SQUARES = (1..10).map { |n| n * n }

def function(x, i)
  x * x - i
end

def derivative(x)
  2 * x
end

def square_root(num)
  x0 = 1
  x1 = nil
  loop do
    y = function(x0, num)
    yprime = derivative(x0)
    x1 = x0 - BigDecimal.new(y.to_s) / yprime
    break if ((x1 - x0).abs <= TOLERANCE * x1.abs)
    x0 = x1
  end
  x1
end

sum = 0
(1..100).each do |num|
  next if SQUARES.include?(num)
  s = square_root(num).to_s
  str = s.split(".").last
  sum += str.chars.first(100).map(&:to_i).sum
end
puts sum