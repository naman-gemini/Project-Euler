# Instead of calculating all partitions and then finding indivudal sums, we can reduce our search space by some simple optimizations
#
# Iterate over 10^6 numbers (n), find if their square (s) is S-number or not
# Partition s in 2 halves left and right (start with last digit being right) and try to make the sum n, by moving towards left gradually (use powers of 10 den to do this)
#
# There are 2 possibilities now:
## left + right == n (s is S-number)
## right < n (contribute right to the sum n, find rest of the sum in left)

LIMIT = 10**6 # we have to find T(10**12)

def s_number?(n, s)
  return false if s < n # no further partition of s can accumulate to sum n

  den = 10
  while den < s
    left = s / den
    right = s % den
    return true if left + right == n
    if right < n && s_number?(n - right, left)
      return true
    end
    den *= 10
  end
  false
end

t1 = Time.now
sum = 0
(2..LIMIT).each do |n|
  # next if n % 9 > 1 # this is a mod 9 optimization that I found in forums - https://projecteuler.net/action=redirect;post_id=359366
  if s_number?(n, n * n)
    sum += n * n
    # puts n*n
  end
end
puts sum

puts "Time taken: #{Time.now - t1} seconds"
# Time taken: 19.4549014 seconds
