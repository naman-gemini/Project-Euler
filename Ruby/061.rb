require 'pry'

t1 = Time.now

def formulas(n)
	[n*(n+1)/2, n*n, n*(3*n-1)/2, n*(2*n-1), n*(5*n-3)/2, n*(3*n-2)]
end

def four_digit_check?(n)
	n > 999 and n < 10000
end

def fill_list
	(1..141).each do |n|
	  formulas(n).each_with_index do |formula, index|
	  	$list[index] ||= []
	  	$list[index] << formula if four_digit_check?(formula)
	  end
	end
end

# number_array: chain of numbers considered
# visited_array: truth array denoting which type of number is already in the chain
def search_next(number_array, visited_array)
	if visited_array.uniq.size == 1 && visited_array.uniq.first == 1 && number_array.size == 6 && number_array.last.to_s[-2,2] == number_array.first.to_s[0,2]
		puts number_array.join(",")
		puts "Sum of the series: #{number_array.sum}"
	end
	temp_visited_array = visited_array.clone
	visited_array.each_with_index do |visited, index|
		visited_array = temp_visited_array.clone
		if visited == 0
			matched_numbers = $list[index].select{|t| t.to_s[0, 2] == number_array.last.to_s[-2, 2]}
			if matched_numbers.size > 0
				visited_array[index] = 1
			else
				next
			end
			matched_numbers.each do |number|
				search_next(number_array + [number], visited_array)
			end
		end
	end
end

$list = []
ans = []

fill_list

$list[0].each do |triangle_number|
	search_next([triangle_number], [1, 0, 0, 0, 0, 0])
end

puts "Time taken: #{Time.now - t1} seconds"