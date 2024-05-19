arr = IO.readlines("poker_result.txt")
arr2 = IO.readlines("poker_result_2.txt")
i = 0
while i<1000 do
	puts i+1 if arr[i] != arr2[i]
	i+=1
end
