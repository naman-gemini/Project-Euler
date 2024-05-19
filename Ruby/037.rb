MAX = 1_000_000
require_relative 'euler'

def truncable?(n)
  flag = $prime[n]
  sz = n.to_s.size
  1.upto(sz).each do |i|
    flag &&= $prime[n.to_s[0...i].to_i] && $prime[n.to_s[i..-1].to_i]
  end
  flag
end

sieve
$prime[0] = true

ans = 0
11.upto(MAX).each do |num|
  ans += num if truncable?(num)
end
puts ans