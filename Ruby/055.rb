def palindrome?(n)
  n.to_s == n.to_s.reverse
end

def lychrel?(n)
  50.times do
    sum = n + n.to_s.reverse.to_i
    return false if palindrome?(sum)
    n = sum
  end
  true
end

cnt = 0
(1..10_000).each do |num|
  cnt += 1 if lychrel?(num)
end
puts cnt