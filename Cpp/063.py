count=0
for a in xrange(1,1000):
    for b in xrange(1,1000):
        if len(str(b**a))==a:
            count+=1
            #print b
            #print a
            #print b**a
            #print "-------------------"
        elif len(str(b**a))>a:
            break
print count