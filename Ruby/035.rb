MAX = 1_000_000
require_relative 'euler'

def circular?(num)
  str = num.to_s
  sz = str.size
  flag = true
  (sz - 1).times do
    str = str.chars.rotate.join
    flag &&= $prime[str.to_i]
    return false if !flag
  end
  true
end

sieve
count = 0
arr = []
(2..MAX).each do |num|
  count += 1 if circular?(num) && $prime[num]
end
puts count