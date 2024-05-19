# Brute force
# Answer: 986262; Time: 45.800358 seconds

MAX = 10**7
time = Time.now

divisors = [1] * MAX

2.upto(MAX / 2).each do |i|
  # Increment all multiples of i
  (i * 2).step(MAX - 1, i).each do |j|
    divisors[j] += 1
  end
end

count = 0
2.upto(MAX - 2).each do |i|
  count += 1 if divisors[i] == divisors[i + 1]
end
puts count

puts "Time: #{Time.now - time} seconds"