#include<cstdio>
#include<iostream>
#include<cmath>
#define MAX 100000000
using namespace std;

bool prime[MAX];
int arr[10];

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


void init(int a)
{
    for(int i=1;i<=a;i++)
        arr[i]=0;
}

//check for repitition
int check(int a)
{
    while(a)
    {
        if(arr[a%10]==0)
        {
            arr[a%10]=1;
            a/=10;
        }
        else return 0;
    }
    return 1;
}

int cond(int a)
{
    for(int i=1;i<=a;i++)
    {
        if(arr[i]==0) return 0;
    }
    return 1;
}

int main()
{
    init();
    precal();
    //cout<<(int)(log10(21000))+1;
    for(int i=9999999;i>=0;i--)
    {
        // initalize arr for number of digits in i (to check for pandigital)
        init((int)(log10(i))+1);
        if(!check(i)) continue;
        if(prime[i] && cond((int)(log10(i))+1))
        {
            cout<<i;
            return 0;
        }
    }
}
