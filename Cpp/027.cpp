#include<iostream>
#define MAX 10000000
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

int calc(int i,int a,int b)
{
    return i*i+a*i+b;
}

int main()
{
    init();
    precal();
    int ans=0,prod;
    for(int a=-1000;a<=1000;a++)
    {
        for(int b=-1000;b<=1000;b++)
        {
            int cnt=0;
            for(int i=0;;i++)
            {
                if (prime[calc(i,a,b)]) cnt++;
                else break;
            }
            if(cnt>ans)
            {
                ans=cnt;
                prod=a*b;
            }
        }
    }
    cout<<prod;
}
