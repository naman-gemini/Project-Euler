MAX = 2_000_000
require_relative 'euler'

sieve
ans = 0

$prime.each_with_index do |x, i|
  ans += i if x
end
puts ans