MAX = 1_000_000

class String
  def palindrome?
    self == self.reverse
  end
end

puts (1..MAX).select { |i| i.to_s.palindrome? && i.to_s(2).palindrome? }.sum