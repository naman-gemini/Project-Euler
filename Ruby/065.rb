a = []
h = []
k = []

a[0],a[1],a[2] = 2,1,2
x = 2
for i in 3..100
	if (i-2)%3 == 0
		a[i] = 2*x
		x += 1
	else
		a[i] = 1  
	end
end

h[0], h[1] = 2, 3
k[0], k[1] = 1, 1

for i in 2..100
	h[i] = a[i]*h[i-1] + h[i-2]
	k[i] = a[i]*k[i-1] + k[i-2]
end

puts h[99]
puts h[99].to_s.split("").inject(0) { |sum, n| sum + n.to_i }

