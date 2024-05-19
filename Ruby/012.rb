def factor_count(n)
  product = 1
  cnt = 0
  x = 2
  while x <= n do
    cnt = 0
    while n % x == 0 do
      cnt += 1
      n = n / x
    end
    x += 1
    product *= cnt + 1
  end
  product
end

factors = 0
n = 1
max = 0
while n > 0 do
  number = n * (n + 1) / 2
  factors = factor_count(number)
  break if factors >= 500
  n += 1
end

puts "#{number} #{factors}"