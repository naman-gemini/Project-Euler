MAX = 10_000

def pandigital?(a, b)
  (a.to_s + b.to_s + (a * b).to_s).chars.sort.join == (1..9).to_a.join
end

arr = []

(1..MAX).each do |a|
  (1..MAX).each do |b|
    break if (a.to_s + b.to_s + (a * b).to_s).size > 9
    arr << a * b if pandigital?(a, b)
  end
end

puts arr.uniq.sum