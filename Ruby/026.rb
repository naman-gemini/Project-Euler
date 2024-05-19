def solve(d)
  remainders = [1]
  dividend = 10
  loop do
    remainder = dividend % d
    return 0 if remainder == 0
    if remainders.include?(remainder)
      return calc_length(remainders, remainder)
    else
      remainders << remainder
    end
    dividend = remainder * 10
  end
end

def calc_length(arr, val)
  arr.size - arr.index(val)
end

max = 0
ans = 0

(1..999).each do |d|
  len = solve(d)
  if len > max
    max = len
    ans = d
  end
end

puts max
puts ans