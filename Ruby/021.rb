def divisor_sum(n)
  sum = 1
  i = 2
  while i <= n / 2 do
    if n % i == 0
      sum += i
    end
    i += 1
  end
  sum
end

n = 2
sum = 0

while n <= 10000 do
  x = divisor_sum(n)
  sum += n + x if n < x && n == divisor_sum(x)
  n += 1
end

puts sum