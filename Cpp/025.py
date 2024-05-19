a=1
b=1
c=1
count=2
while len(str(c))<1000:
    c=a+b
    a=b
    b=c
    count+=1
print count
print c
