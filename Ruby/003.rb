# have to do prime factorisation here
# NOTE: no need to create sieve for all primes for prime factorization
# Key observation: Every number n can at most have one prime factor greater than n

NUMBER = 600851475143

def largest_prime_factor(n)
  # handle even factors first
  if n % 2 == 0
    greatest_factor = 2
    while n % 2 == 0
      n /= 2
    end
  else
    greatest_factor = 1
  end

  # handle odds now
  factor = 3
  while n > 1 && factor * factor <= n
    while n % factor == 0
      greatest_factor = factor
      n /= factor
    end
    factor += 2
  end

  # after all factors have been taken out
  if n == 1
    return greatest_factor
  else
    return n
  end
end

puts largest_prime_factor(NUMBER)
