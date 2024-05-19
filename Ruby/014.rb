# stores the number of numbers in collatz sequence
$collatz = Hash.new(1)

def calculate(n)
  val = n
  while val > 1 do
    $collatz[n] += 1
    if val % 2 == 0
      val /= 2
    else
      val = 3 * val + 1
    end
  end
  return $collatz[n]
end

n = 1
MAX = 1_000_000

while n < MAX do
  calculate(n)
  n += 1
end

puts $collatz.sort_by { |_, v| v }.last.first