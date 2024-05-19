c = 0
for i in xrange(10,10000):
   r = i
   for x in xrange(50):
      r += int(str(r)[::-1])
      if str(r) == str(r)[::-1]: break
   else:
      c += 1
print(c)