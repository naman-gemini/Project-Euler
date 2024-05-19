ascii_codes = File.open("p059_cipher.txt").read.strip.split(",")
keys = ('a'..'z').to_a.product(('a'..'z').to_a).product(('a'..'z').to_a).map(&:flatten)

# KEY FINDER:
puts "------------------ KEY FINDER -------------------"
keys.each do |key|
  text = []
  0.upto(ascii_codes.size - 1) do |i|
    text << (ascii_codes[i].to_i ^ key[i % 3].ord).chr
  end
  text = text.join("")
  if text.include?("The")
    puts "*"*100
    puts key.join("")
    puts text
  end
end


# key: god
puts "------------------ CODE FINDER -------------------"
key = 'god'
ascii_arr = []
0.upto(ascii_codes.size - 1) do |i|
  ascii_arr << (ascii_codes[i].to_i ^ key.chars[i % 3].ord)
end
puts ascii_arr.map(&:to_i).sum