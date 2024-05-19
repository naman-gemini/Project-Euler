# Brute force solution like in 76 and 77 doesn't work here
# Which means we need a generating function here
# https://en.wikipedia.org/wiki/Pentagonal_number_theorem
# This gives the recurrence
# p(n) = p(n-1) + p(n-2) - p(n-5) - p(n-7)...
# NOTE: The signs are of form +, + , -, -, +, +
# p(0) = 1, p(n) = 0 if n < 0
# p(n) = Summation( (-1)^(k - 1) p(n - g(k)) ) where g(k) is kth generalised pentagonal number
# NOTE: generalised pentagonal numbers is different series than pentagonal numbers
# g(k) = k * (3 * k - 1) / 2 for |k| >= 1 (1, -1, 2, -2 ...)
# *********************************************************************************************
# PROOF IS NOT WORTH WASTING A LOT OF TIME
# FOR YOU'RE A PROGRAMMER AND NOT A MATHEMATICIAN

MOD = 1_000_000

p = [1] # p[0] = 1
n = 1
loop do
  sum = 0
  (0..n).each do |k|
    j = (k % 2 == 0) ? k / 2 + 1 : -(k / 2 + 1);
    pentagonal_number = j * (3 * j - 1) / 2
    # puts "k = #{k}, pentagonal_number = #{pentagonal_number}"
    break if n - pentagonal_number < 0
    if k % 4 <= 1
      sum += p[n - pentagonal_number] 
    else
      sum -= p[n - pentagonal_number]
    end
    sum %= MOD
  end
  p[n] = sum
  # puts "n = #{n}, ways = #{sum}"
  if sum == 0
    puts n
    break
  end
  n += 1
end