def calc(a):
    temp=0
    while(a):
        temp+=a%10
        a/=10
    return temp

ans=0
for i in range (1,100):
    for j in range (1,100):
        if calc(i**j) > ans:
            ans=calc(i**j)
print ans
