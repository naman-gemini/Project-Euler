MAX = 1_000_000
prime = []
$ans = MAX

def sieve(prime)
	prime[1] = false
	(2..MAX).each.map{|t| t%2 == 0 ? prime[t] = false : prime[t] = true}
	(3..MAX).step(2).each do |i|
		break if i*i > MAX
		if prime[i]
			(i*i..MAX).step(i).each do |j|
				prime[j] = false
				break if j > MAX
			end
		end
	end
end

def fill_pattern(pattern, a)
	pattern.reverse.split("").each_with_index do |char, i|
		if char == '1'
			pattern[i] = (a%10).to_s
			a /= 10
		else
			pattern[i] = "*"
		end
	end
	pattern.reverse!
end

def generate_number(pattern, a)
	pattern.gsub("*", a.to_s)
end

def get_family_value(pattern, repeating_digit, prime)
	family_value = 1
	# puts pattern
	# puts "Repeating: #{repeating_digit}"
	((repeating_digit.to_i+1)..9).each do |x|
		# puts "val = #{pattern.gsub("*", x.to_s).to_i}"
		family_value += 1 if prime[pattern.gsub("*", x.to_s).to_i]
	end
	# puts "Family Value: #{family_value}"
	family_value
end

def calculate(patterns, a, prime)
	patterns.each do |pattern|
		fill_pattern(pattern, a)
		# x being the repeated digit
		(0..2).each do |x|
			number = generate_number(pattern, x)
			# continue in case of leading zeroes
			next if number[0] == '0'
			family_value = get_family_value(pattern, x, prime)
			$ans = number.to_i if family_value == 8 && number.to_i < $ans
		end
	end
end

def replace_and_count(a, prime)
	five_digit_patterns = [1, 1, 0, 0, 0].permutation.map(&:join).uniq.reject{|t| t[-1,1] == "0"}
	six_digit_patterns = [1, 1, 1, 0, 0, 0].permutation.map(&:join).uniq.reject{|t| t[-1,1] == "0"}
	if a < 100
		calculate(five_digit_patterns, a, prime)
	else
		calculate(six_digit_patterns, a, prime)
	end
end

def solve(a, prime)
	# last digit can't be even or 5
	return if ((a%10)%2 == 0 or a%10 == 5)
	# a should not have all repeating digits
	return if a.to_s.split("").uniq.join("").size == 1
	# sum of non repeating digits%3 should not be 0
	return if a.to_s.split("").map(&:to_i).inject(:+)%3 == 0
	replace_and_count(a, prime)
end

sieve(prime)
# loop of non repeating numbers
(100..1000).each do |i|
	solve(i, prime)
end
puts $ans

