MAX = 1_000_000
count = 0

1.upto(100).each do |n|
  1.upto(n).each do |r|
    r = n - r if n - r < r
    # puts "n = #{n}, r = #{r}"
    if r == 0
      val = 1
    elsif r == 1
      val = n
    else
      val = ((n - r + 1)..n).inject(:*) / (1..r).inject(:*)
    end
    # puts "val = #{val}"
    count += 1 if val > MAX
  end
end

puts count