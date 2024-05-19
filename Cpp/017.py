nums = {0:0, 1:3, 2:3, 3:5, 4:4, 5:4, 6:3, 7:5, 8:5, 9:4, 10:3, 11:6, 12:6, 13:8, 14:8, 15:7, 16:7, 17:9, 18:8, 19:8, 20:6, 30:6, 40:5, 50:5, 60:5, 70:7, 80:6, 90:6, 100:7}

sumletters = 11 # one thousand
for i in range(1000):
   sumletters += nums[int(i/100)] + nums[100 if i>99 else 0] + ((nums[int((i%100)/10)*10] + nums[(i%100)%10]) if i%100 > 19 else nums[i%100])
   if i > 100 and i%100!=0: sumletters += 3 # and

print(sumletters)
