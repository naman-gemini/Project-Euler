MAX = 1_000_000

# NOTE: String concatenation one by one will be super slow.
# str = ""
# (1..MAX.each do |x|
#   str += x.to_s
# end

str = (1..MAX).to_a.join

product = 1
div = 1
while div <= MAX
  product *= str[div - 1].to_i
  div *= 10
end
puts product