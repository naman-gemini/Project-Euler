#include<cstdio>
#define MAX 2000005
using namespace std;

bool prime[MAX];

void init()
{
    prime[1]=false;
    prime[2]=true;
    for(int i=3; i<=MAX; i++)
        if(i%2==0) prime[i]=false;
        else prime[i]=true;
}

void precal()
{
    for(int i=3; i*i<=MAX; i+=2)
    {
        if(prime[i])
        for(int j=i*i; j<=MAX; j+=i)
        {
            prime[j]=false;
        }
    }
}

int main()
{
    int n;
    init();
    precal();
    long long sum=0;
    for(int i=2;i<=2000000;i++)
    {
        if(prime[i]) sum+=i;
    }
    printf("%lld\n",sum);
}
