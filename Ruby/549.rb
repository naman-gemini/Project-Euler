# Using Smarandache Function to calculate s(n). Reference: http://mathworld.wolfram.com/SmarandacheFunction.html
# Ans: 476001479068717; Time: 145s

MAX = 10 ** 8
require_relative 'euler'

t1 = Time.now
sieve
$prime_numbers = []
$primes.each_with_index { |flag, i| $prime_numbers << i if flag }

$sn = {}
$ans = 0

# Solve each p^e and save in a hash
def precal_p_e
  $prime_numbers.each do |p|
    e = 1
    n = p * e
    while n <= MAX && e <= p
      $sn[n] = e * p
      $ans += e * p
      n *= p
      e += 1
    end
    while n <= MAX # Using Smarandache Function from above article when e > p
      a = 1
      an = (a * p) + 1
      while an <= e
        a = an
        an = a * p + 1
      end
      kv = e / an
      rv = e % an
      sum = (p - 1) * e + kv
      while rv != 0
        an = (an - 1) / p
        kv = rv / an
        rv = rv % an
        sum += kv
      end
      $sn[n] = sum
      $ans += sum
      n *= p
      e += 1
    end
  end
end

def solve(n, i, sn)
  prev_n = n
  (i + 1).upto($prime_numbers.size - 1).each do |idx|
    new_p = $prime_numbers[idx]
    n = prev_n * new_p
    break if n > MAX # no need to check for next primes
    while n <= MAX
      # As, n and new_p must be mutually co-prime
      # s(n) of multiplication of n and new_p => s(n * new_p)
      # $sn[n] = [$sn[prev_n], $sn[new_p]].max # sn[prev_n] and sn[new_p] must have been calculated in precal_p_e
      # $ans += $sn[n]
      new_sn = [sn, $sn[new_p]].max # actually, we don't really need to store this in sn hash. It can be sent as a param to our solve function (Decreases run time by ~ 50 seconds)
      $ans += new_sn
      solve(n, idx, new_sn)
      new_p *= $prime_numbers[idx]
      n = prev_n * new_p
    end
  end
end

precal_p_e

# Now that we've calculated all s(p^e), we need to calculate the numbers with product of prime factors
# s(p1^e1 * p2^e2 * .... pk^ek) = max(s(p1^e1), s(p2^e2), .... s(pk^ek))
#
# Making combinations of prime factors in an incremental manner
# This should be O(n) ~ 10**8 iterations as that should be max numbers that we'll be generating
$prime_numbers.each_with_index do |p, i|
  n = p
  while n <= MAX
    solve(n, i, $sn[n])
    n *= p
  end
end
puts $ans

puts "Time Taken: #{Time.now - t1} seconds"