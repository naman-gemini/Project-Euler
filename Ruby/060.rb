require 'Prime'
MAX = 10_000
primes = Prime.each(MAX).to_a

def prime_pair?(a, b)
  (a.to_s + b.to_s).to_i.prime? && (b.to_s + a.to_s).to_i.prime?
end

sum = 1_000_000_000
sz = primes.size
# assuming a, b, c, d, e are the index of required numbers
# assuming they're in increasing order
0.upto(sz - 1).each do |a|
  break if 5 * primes[a] > sum
  (a + 1).upto(sz - 1).each do |b|
    break if primes[a] + 4 * primes[b] > sum
    next if !prime_pair?(primes[a], primes[b])
    (b + 1).upto(sz - 1).each do |c|
      break if primes[a] + primes[b] + 3 * primes[c] > sum
      next if !prime_pair?(primes[a], primes[c]) || !prime_pair?(primes[b], primes[c])
      (c + 1).upto(sz - 1).each do |d|
        break if primes[a] + primes[b] + primes[c] + 2 * primes[d] > sum
        next if !prime_pair?(primes[a], primes[d]) || !prime_pair?(primes[b], primes[d]) || !prime_pair?(primes[c], primes[d])
        (d + 1).upto(sz - 1).each do |e|
          break if primes[a] + primes[b] + primes[c] + primes[d] + primes[e] > sum
          next if !prime_pair?(primes[a], primes[e]) || !prime_pair?(primes[b], primes[e]) || !prime_pair?(primes[c], primes[e]) || !prime_pair?(primes[d], primes[e])
          if primes[a] + primes[b] + primes[c] + primes[d] < sum
            sum = primes[a] + primes[b] + primes[c] + primes[d] + primes[e]
            puts "a = #{primes[a]}, b = #{primes[b]}, c = #{primes[c]}, d = #{primes[d]}, e = #{primes[e]}"
          end
        end
      end
    end
  end
end

puts sum