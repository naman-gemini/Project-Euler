def colatz(i,count):
    if i==1:
        return count
    if i%2==0:
        return colatz(i/2,count+1)
    else:
        return colatz(3*i+1,count+1)
    
ans=1
for i in range(1,1000001):
    x=colatz(i,1)
    if x>ans:
        ans=x
        ret=i
print ret
