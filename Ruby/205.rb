# Probability = Favorable outcomes / Total Outcomes
# P(Pete wins) = Summation[i: 9 -> 36](P(Pete rolls i) * P(Collin rolls less than i))

# NOTE: Can be done easily with using repeated_permutation in ruby

RANGE_4 = (1..4)
RANGE_6 = (1..6)
TOTAL_X = 4**9
TOTAL_Y = 6**6

total_probability = 0

(9..36).each do |i| # i represents Pete's total
  ways = 0
  RANGE_4.each do |x1|
    RANGE_4.each do |x2|
      RANGE_4.each do |x3|
        RANGE_4.each do |x4|
          RANGE_4.each do |x5|
            RANGE_4.each do |x6|
              RANGE_4.each do |x7|
                RANGE_4.each do |x8|
                  RANGE_4.each do |x9|
                    ways += 1 if x1 + x2 + x3 + x4 + x5 + x6 + x7 + x8 + x9 == i # Pete's total should be equal to i
                  end
                end
              end
            end
          end
        end
      end
    end
  end
  p_x = ways.to_f / TOTAL_X # probablity that Pete rolls i

  j = 6 # 6 -> 36
  ways = 0
  j.upto(i - 1) do |k| # k represents Colin's total
    RANGE_6.each do |y1|
      RANGE_6.each do |y2|
        RANGE_6.each do |y3|
          RANGE_6.each do |y4|
            RANGE_6.each do |y5|
              RANGE_6.each do |y6|
                ways += 1 if y1 + y2 + y3 + y4 + y5 + y6 == k # If we just do summation(y) < i. That would repeat a lot of cases.
              end
            end
          end
        end
      end
    end
  end
  p_y = ways.to_f / TOTAL_Y # probability that Colin rolls lesser than Pete's roll

  total_probability += p_x * p_y # probability that Pete beats Colin for this value of i
end

puts '%0.7f' % total_probability