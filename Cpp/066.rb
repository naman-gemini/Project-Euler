# *************** DOESN'T WORK ***************
# Refer: https://www.mathblog.dk/project-euler-66-diophantine-equation/

Inf = 1.0/0.0

def is_square?(n)
	(Math.sqrt(n).to_i)*(Math.sqrt(n).to_i) == n
end

max = 0
ans = 0
(2..1000).each do |d|
	next if is_square?(d)
	puts "d=#{d}"
	(1..Inf).each do |y|
		if is_square?(1+d*y*y)
			x = Math.sqrt(1+d*y*y).to_i
			if x>max
				max = x
				puts "x=#{x}"
				ans = d
			end
			break
		end
	end
end
puts ans