# Max number in pascal triangle should be 51C25
# Max prime number required should be less than sqrt(51C25) ~ 15746722
# BUT THAT IS WRONG!
# nCk = n!/k!(n-k)!
# So each prime to divide nCk should be less than n
# Hence the largest prime that we need to consider, the square of it should be less than 51
# Answer: 34029210557338; Time: 0.003623 seconds

PASCAL_ROWS = 51
require_relative 'euler'

time = Time.now

arr = []
0.upto(PASCAL_ROWS - 1).each do |n|
  (0..n).each do |r|
    arr << nCr(n, r)
  end
end 
arr.uniq!

[2, 3, 5, 7].each do |p|
  start = 0
  start.upto(arr.size - 1).each do |i|
    arr[i] = 0 if arr[i] % (p * p) == 0
  end
  arr.reject! { |t| t == 0 }
end

puts arr.sum
puts "Time: #{Time.now - time} seconds"