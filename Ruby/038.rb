def pandigital?(a)
  a.chars.sort.join == (1..9).to_a.join
end

list = []
1.upto(99_999) do |num|
  n = 1
  str = ""
  loop do
    str += (num * n).to_s
    break if str.size > 9
    if pandigital?(str)
      list << str.to_i
      break
    end
    n += 1
  end
  num += 1
end
puts list.max

