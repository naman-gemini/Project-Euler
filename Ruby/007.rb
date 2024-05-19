MAX = 1_000_000
require_relative 'euler'

sieve
ans = []

(1..MAX).each do |x|
  ans << x if x.prime?
end
puts ans[10000]