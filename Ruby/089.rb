# Approach:
# 1) Parse roman numeral and convert to base 10 normal number
# 2) Convert to correct roman numeral
# 3) Calculate the difference
# Answer: 743; Time: 0.041541 seconds

KEY = { 'M' => 1000, 'D' => 500, 'C' => 100, 'L' => 50, 'X' => 10, 'V' => 5, 'I' => 1 }

def parse(roman_numeral)
  val = 0
  prev = roman_numeral[0]
  i = 1
  sz = roman_numeral.size
  return KEY[roman_numeral[0]] if sz == 1
  while i < sz
    curr = roman_numeral[i]
    if KEY[curr] <= KEY[prev]
      val += KEY[prev]
      prev = curr
    else
      val += KEY[curr] - KEY[prev]
      # Skip over the subtraction pair, it's value has already been added
      i += 1
      prev = roman_numeral[i]
    end
    i += 1
  end
  val += KEY[roman_numeral[-1]] if KEY[roman_numeral[-1]] <= KEY[roman_numeral[-2]]
  val
end

def convert(number)
  numeral = ''
  KEY.values.each do |val|
    while number > 0
      loop do
        if number < 1000 && number / 100 == 9
          numeral += 'CM'
          number -= 900
        elsif number < 500 && number / 100 == 4
          numeral += 'CD'
          number -= 400
        elsif number < 100 && number / 10 == 9
          numeral += 'XC'
          number -= 90
        elsif number < 50 && number / 10 == 4
          numeral += 'XL'
          number -= 40
        elsif number == 9
          numeral += 'IX'
          number -= 9
        elsif number == 4
          numeral += 'IV'
          number -= 4
        else
          break
        end
      end
      if number / val >= 1
        numeral += KEY.invert[val]
        number -= val
      else
        break
      end
    end
  end
  numeral
end

time = Time.now

sum = 0
File.open('p089_roman.txt').read.each_line do |line|
  roman_numeral = line.strip
  number = parse(roman_numeral)
  converted_numeral = convert(number)
  sum += roman_numeral.size - converted_numeral.size
end
puts sum
puts "Time: #{Time.now - time} seconds"
