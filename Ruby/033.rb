MAX = 99

def cancel(a, b)
  common = (a.to_s.chars & b.to_s.chars)
  return 0 if common.empty? || common.include?('0')
  # puts a.to_s.delete(common)
  # puts b.to_s.delete(common)
  common = common.to_s
  a.to_s.delete(common).to_f / b.to_s.delete(common).to_f
end

ans = []
1.upto(MAX - 1).each do |num|
  (num + 1).upto(MAX).each do |den|
    val = num.to_f / den
    if val == cancel(num, den)
      ans << "#{num}/#{den}"
    end
  end
end

puts ans