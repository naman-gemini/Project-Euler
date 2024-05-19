#include<cstdio>
#include<iostream>
#include<vector>
#include<algorithm>
#define MAX 10000
using namespace std;

bool prime[MAX];
vector<int> v;
vector<int> v2;

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

void generate_sieve()
{
    init();
    precal();
    for(int i=2;i<=MAX;i++)
        if(prime[i]) v.push_back(i);
}

void generate_squares()
{
    for(int i=1;i*i<=MAX;i++)
        v2.push_back(2*i*i);
}

int main()
{
    generate_sieve();
    generate_squares();
    for(int i=9;i<MAX;i+=2)
    {
        if(prime[i]==true) continue;
        bool found=false;
        for(int j=0;v[j]<=i;j++)
        {
            if(binary_search(v2.begin(),v2.end(),i-v[j]))
            {
                found=true;
                break;
            }
        }
        if(found==false)
        {
            cout<<i;
            return 0;
        }
    }
}
