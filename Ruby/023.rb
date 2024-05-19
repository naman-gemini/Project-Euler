# Searching in the list for sum pairs can be very slow
# Specially when we don't have binary search implementation in ruby
# Instead, we can put up all combinations of sums O(n^2) and reject which are abundant

require 'mathn'
MAX = 28123

def divisor_sum(n)
  sum = 1
  i = 2
  while i * i <= n do
    if n % i == 0
      sum += i
      res = n / i
      sum += res unless res == i
    end
    i += 1
  end
  sum
end

def abundant?(n)
  divisor_sum(n) > n
end

def abundant_numbers
  (1..MAX).select { |num| num if abundant?(num) }
end

numbers = abundant_numbers
sums = []

numbers.each_with_index do |x, i|
  numbers[i..numbers.size].each do |y|
    sum = x + y
    sums << sum if sum <= MAX
  end
end

sums.uniq!
puts (1..MAX).reject { |num| sums.include?(num) }.sum