require 'prime'
$primes = Prime.each(1_000).to_a
$ans = {}

def change(val, size)
  return $ans["#{val}_#{size}"] unless $ans["#{val}_#{size}"].nil?
  
  if val == 0
    $ans["#{val}_#{size}"] = 1
    return 1
  end
  return 0 if size == 0 || val < 0
  return 0 if size <= 0 && val > 0

  $ans["#{val}_#{size}"] = change(val - $primes[size - 1], size) + change(val, size - 1)
end

def find_size(n)
  $primes.each_with_index do |p, i|
    return i if p > n
  end
end

n = 1
loop do
  if change(n, find_size(n)) > 5_000
    puts n
    break
  end
  n += 1
end