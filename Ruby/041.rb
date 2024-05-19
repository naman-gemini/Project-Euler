require 'prime'

9.downto(1).each do |x|
  x.downto(1).to_a.permutation.each do |nums|
    num = nums.join.to_i
    if num.prime?
      puts num
      return
    end
  end
end