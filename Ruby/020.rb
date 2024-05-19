def factorial(n)
  (1..n).inject(:*)
end

puts factorial(100).to_s.split("").sum(&:to_i)