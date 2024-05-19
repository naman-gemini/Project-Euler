# Brute forced to append ascending numbers for digits ~ 10
# Found a pattern and followed it on Oeis
# Turns out ascending numbers are: (n + 8)C8 ; for n being the number of digits (https://oeis.org/A000581)
# Descending numbers are (10 + n - 1)Cn - 1 ; for n being the number of digits (https://oeis.org/A035927)
# Ascending and descending have certain elements in common, so we have to decrease them once
# For ex: for 3 digits 333, 444, etc. come in ascending as well as descending
#
# Cumulating above: Ascending numbers + Descending Numbers - Common Elements + Bouncy Numbers = Total Numbers (for n digits)
# Common elements = 9 ; for all values of n (basically all digits repeated)
# Total Numbers = 9 * (10 ** (number of digits - 1))
#
# Answer: 51161058134250; Time: 0.00125 seconds
require_relative 'euler'

time = Time.now

total = 9 # Single digit numbers
# Iterate on number of digits
(2..100).each do |n|
  # total = 9 * ( 10 ** (n - 1) )
  ascending = nCr(n + 8, 8)
  descending = nCr(9 + n, n) - 1
  common = 9
  total += ascending + descending - 9
  # bouncy_numbers += (total - ascending - descending + common)
end
puts total
puts "Time: #{Time.now - time} seconds"

# The correct Combinatorics logic is explained well here:
# https://github.com/nayuki/Project-Euler-solutions/blob/master/python/p113.py
# https://www.mathblog.dk/project-euler-113-googol-not-bouncy/
# If we consider leading zeroes then we can don't have to handle each digits case separately
# If there can be an n number of zeroes in beginning, the case of n handles all digits from 0 digits to n digits

#######################################################################
# Generate ascending and descending numbers till small number of digits
#
# MAX = 10
# digits_arr_hash = {1 => (1..9).to_a}
# (2..MAX).each do |num|
#   digits_arr_hash[num] = []
# end

# (2..MAX).each do |digits|
#   pre = digits - 1
#   digits_arr_hash[pre].each do |a|
#     (0..9).each do |b|  # (0..9) should be (1..9) for ascending
#       if a.to_s[-1].to_i >= b.to_i
#         digits_arr_hash[digits] << (a.to_s + b.to_s).to_i
#       end
#     end
#   end
# end

# counts_hash = {}
# digits_arr_hash.each do |k, v|
#   counts_hash[k] = v.count
# end
# puts counts_hash