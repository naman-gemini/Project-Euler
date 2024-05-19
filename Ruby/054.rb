# INCOMPLETE: TOO BORING

RANK = %w[rf sf 4k fh fl st 3k 2p 1p hc]

def royal_flush(arr)

end

def win_condition(arr)
  return 'rf' if royal_flush(arr)
end

p1_count = 0
File.open('p054_poker.txt').read.each_line do |line|
  line.strip
  hands = line.split(" ")
  p1 = hands.first(5)
  p2 = hands.last(5)
  p1_win_condition = win_condition(p1)
  p2_win_condition = win_condition(p2)
  p1_count += 1 if RANK.find_index(p1_win_condition) > RANK.find_index(p2_win_condition)
end