# Using Euclid's formula to generate pythogorean triplets (https://en.wikipedia.org/wiki/Pythagorean_triple)
require_relative 'euler'

MAX = 1_500_000
MAX_ROOT = Math.sqrt(MAX)

ans = Hash.new(0)
res = 0
# m > n > 0
1.upto(MAX_ROOT - 1).each do |n|
  (n + 1).upto(MAX_ROOT).each do |m|
    next unless gcd(m, n) == 1 && (m - n) % 2 == 1
    k = 1
    loop do
      p = 2 * m * (m + n) * k
      break if p > MAX
      # puts "a = #{k*(m*m-n*n)}, b = #{k*2*m*n}, c = #{k*(m*m+n*n)}, p = #{p}"
      # puts "m = #{m}, n = #{n}, k = #{k}, p = #{p}"
      ans[p] += 1
      k += 1
    end
  end
end

puts ans.select { |_, v| v == 1}.count
# puts ans.keys
