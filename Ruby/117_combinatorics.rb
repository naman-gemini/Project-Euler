# Same approach as 116_combinatorics.rb
# ways = (grey + red + green + blue )! / grey! red! green! blue!
# We iterate over max values for each tile
#
# Answer: 100808458960497; Time: 0.002776 seconds
GREY = 50

MAX_RED = GREY / 2
MAX_GREEN = GREY / 3
MAX_BLUE = GREY / 4

$cache = {}

def fact(n)
  return 1 if n == 0 || n == 1
  return $cache[n] if $cache.key?(n)
  $cache[n] = n * fact(n - 1)
end

time = Time.now

ways = 0
(0..MAX_RED).each do |red|
  (0..MAX_GREEN).each do |green|
    (0..MAX_BLUE).each do |blue|
      grey = GREY - red * 2 - green * 3 - blue * 4
      next if grey < 0
      total = grey + red + green + blue
      ways += fact(total) / fact(grey) / fact(red) / fact(green) / fact(blue)
    end
  end
end
puts ways

puts "#{Time.now - time} seconds"