#include<cstdio>
#include<iostream>
#include<vector>
#define MAX 1000000
using namespace std;

bool prime[MAX];

vector<int> v;

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
    for(int i=1,p=1;p<=10001;i++)
    {
        if(prime[i])
        {
            v.push_back(i);
            p++;
        }
    }
    cout<<v.back();
}
