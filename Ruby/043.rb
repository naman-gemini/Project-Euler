def special_divisibility_property?(str)
  primes = [2, 3, 5, 7, 11, 13, 17]
  flag = true
  primes.each_with_index do |prime, i|
    flag &&= (str[(i + 1)..(i + 3)].to_i % prime == 0)
    return false if !flag
  end
  flag
end

sum = 0
(0..9).to_a.permutation.each do |arr|
  next if arr.first == 0
  sum += arr.join.to_i if special_divisibility_property?(arr.join)
end
puts sum