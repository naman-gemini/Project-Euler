FACTORIALS = [1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880]
MAX = 1_000_000
$chains = {}

def chain_size(num)
  return $chains[num] if !$chains[num].nil?
  n = num
  hsh = {}
  while hsh[n].nil? && $chains[n].nil? do
    hsh[n] = true
    n = n.to_s.chars.map(&:to_i).sum { |t| FACTORIALS[t] }
  end
  $chains[num] = hsh.keys.size + ($chains[n] || 0)
end

count = 0
(1..MAX).each do |num|
  count += 1 if chain_size(num) == 60
end
puts count