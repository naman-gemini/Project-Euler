def permuted_multiples?(x)
  [2, 3, 4, 5, 6].all? do |multiple|
    x.to_s.chars.sort == (multiple * x).to_s.chars.sort 
  end
end

n = 1
loop do
  if permuted_multiples?(n)
    puts n
    break
  end
  n += 1
end