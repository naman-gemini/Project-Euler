#include<cstdio>
#include<iostream>
#define MAX 1000000000
#define DEBUG(x) printf(#x"=%d\n",x);
using namespace std;

bool arr[MAX];

void init()
{
    arr[1]=false;
    for(int i=2;i<=MAX;i++) arr[i]=true;
}

void sieve()
{
    int x;
    for(int i=2;i*i<MAX;i++)
    {
        x = i*2;
        while(x <= MAX)
        {
            if(arr[x])
            {
                arr[x] = false;
            }
            x += i;
        }
    }
}

int main()
{
    int a,b,c,d;
    int total = 1;
    int count = 0;
    init();
    sieve();
    for(int side=3;;side+=2)
    {
        int n = side/2;
        a = 4*(n+1)*(n+1)-10*(n+1)+7;
        //DEBUG(a);
        b = 4*n*n+1;
        //DEBUG(b);
        c = 4*(n+1)*(n+1) - 6*(n+1) + 3;
        //DEBUG(c);
        if (arr[a]) count++;
        if (arr[b]) count++;
        if (arr[c]) count++;
        total += 4;
        double ratio = double(count)/total;
        printf("%lf\n",ratio);
        if(ratio<0.10)
        {
            printf("%d\n",side);
            break;
        }

    }
    return 0;


}
