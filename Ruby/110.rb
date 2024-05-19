# Problem 108 solution doesn't work here

LIMIT = 4 * 10**6

# First 14 prime numbers
$primes = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43]

time = Time.now

def divisors_sum_n_squared(n)
  ans = 1
  remain = n

  (0).upto($primes.size - 1).each do |i|
    p = $primes[i]
    # In case there is a remainder this is a prime factor as well
    # The exponent of that factor is 1
    return ans * 2 if p * p > n

    exponent = 1
    while remain % p == 0
      exponent += 2 # This is for n squared
      remain /= p
    end

    ans *= exponent

    # If there is no remainder, return the count
    return ans if remain == 1
  end
end

n = 1
result = 0
loop do
  ans = divisors_sum_n_squared(n)
  puts "n = #{n}, ans = #{ans}"
  if (ans + 1) / 2 > LIMIT
    result = n
    break
  end
  n += 1
end
puts result
puts "Time: #{Time.now - time} seconds"