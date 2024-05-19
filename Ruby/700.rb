require_relative 'euler'

a = 1504170715041707
m = 4503599627370517

# n = 2
# small = a
# sum = a
# loop do
#   val = (a * n) % m
#   if val < small
#     puts val
#     sum += val
#     small = val
#     puts "sum = #{sum}"
#   end
#   n += 1
# end

# using above brute force we found Euler coins till 9668957 (sum - 1517926408021493)
# now for eulercoins down to 1 (0 not possible as a and m are co-prime) we can iterate over this small number and check if each number follows condition of eulercoin
# eulercoin = (a * n) % m
# n = eulercoin / (a % m)
# because m is prime, we can use fermat's little theorem to find modular inverse
# n = eulercoin * modular_inverse(a, m)

inv = modular_inverse(a, m)

sum = 1517926408021493
last_euler_coin = 9668957
min = last_euler_coin

# find n for each coin
hash = {}
(last_euler_coin - 1).downto(1).each do |coin|
  n = (coin * inv) % m
  hash[n] = coin
end

# now traverse through the sequence in a linear fashion (increasing n) and see if the next coin follows the condition
hash.sort.to_h.each do |_, v|
  if v < min
    sum += v
    min = v
  end
end
puts sum
