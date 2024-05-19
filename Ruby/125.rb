# a^2 + b^2 .. = n
# Max value of a should be sqrt(max value of n) => 10**4
#
# Answer: 2906969179; Time: 0.208605 seconds

MAX = 10**8
MAX_A = Math.sqrt(MAX).to_i

time = Time.now

def palindrome?(s)
  s.reverse == s
end

arr = []
# Sum of squares from ith index to jth index (both included)
1.upto(MAX_A - 2).each do |i|
  number = i * i
  (i + 1).upto(MAX_A - 1).each do |j|
    number += j * j
    break if number > MAX
    arr << number if palindrome?(number.to_s)
  end
end
puts arr.uniq.sum # There can be duplicates
puts "Time: #{Time.now - time} seconds"