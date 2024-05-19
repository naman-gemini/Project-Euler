# Writing brute force solution it makes it clear that terms increase exponentially.
# a30 is definitely greater than 10^9, hence definitely can't loop over the numbers.
# So, let's generate all possible x^y which follow the criteria
# Modifying MAX and LIMIT by hit and trial. Turns out we don't really need that LIMIT
#
# Answer: 248155780267521; Time: 0.002731 seconds
MAX = 10 ** 2
LIMIT = 10 ** 20

def check?(n)
  sum = n.to_s.chars.map(&:to_i).sum
  return false if sum == 1
  x = 1
  while sum ** x <= n
    return true if sum ** x == n
    x += 1
  end
  false
end

def digit_sum(n)
  n.to_s.chars.map(&:to_i).sum
end

time = Time.now

arr = []
(2..MAX).each do |x|
  (2..MAX).each do |y|
    val = x ** y
    break if val > LIMIT
    arr << val if digit_sum(val) == x
  end
end
# puts arr.count
# puts arr.sort.join(", ")
puts arr.sort[29]

puts "#{Time.now - time} seconds"