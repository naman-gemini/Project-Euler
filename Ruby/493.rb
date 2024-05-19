require_relative 'euler'

# Total Colors = 7
# Balls Picked = 20
# Total Balls = 70
#
# Probability that one particular color is not amongst 20 picked ball
# Basically, means those 20 balls are not picked from the particular colored 10 balls (hence 70 - 10 = 60 balls)
# Probability of not being picked = Favourable / Total = Pick 20 from 60 / Pick 20 from 70 = 60C20 / 70C20
# Probability of that color getting picked (p) = 1 - Probability of not being picked
#
# The expected value of the number of colours present is just the sum of
# the expected values of the number of occurrences of the individual colours,
# which are all equal to p (0 with probability 1−p, 1 with probability p), so the total expectation value is 7p.
#
# Hence, Expected value for 7 colors = 7 * Probability of a color getting picked

puts '%0.9f' % (7 * (1 - nCr(60, 20) / nCr(70, 20).to_f))