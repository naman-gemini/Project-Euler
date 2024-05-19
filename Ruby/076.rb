# Coin change problem
$ans = {}

MAX = 100

def change(val, size)
  return $ans["#{val}_#{size}"] unless $ans["#{val}_#{size}"].nil?
  
  if val == 0
    $ans["#{val}_#{size}"] = 1
    return 1
  end
  return 0 if size == 0 || val < 0
  return 0 if size <= 0 && val > 0

  $ans["#{val}_#{size}"] = change(val - size, size) + change(val, size - 1)
end

puts change(MAX, MAX - 1)