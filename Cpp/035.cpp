#include<cstdio>
#include<iostream>
#include<algorithm>
#include<vector>
#define MAX 1000000
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

int calc(vector<int> v)
{
    int sum=0,x=1;
    for(int i=v.size()-1;i>=0;i--)
    {
        sum+=v[i]*x;
        x*=10;
    }

    return sum;
}

bool check(int a)
{
    vector<int> v;
    while(a)
    {
        v.push_back(a%10);
        a/=10;
    }
    reverse(v.begin(),v.end());
    int x=v.size();
    for(int i=0;i<x;i++)
    {
        v.push_back(v[0]);
        v.erase(v.begin());
        if(prime[calc(v)]==false) return false;
    }
    return true;
}

int main()
{
    init();
    precal();
    int sum=0;
    for(int i=2;i<=1000000;i++)
    {
        if(prime[i] && check(i))
            sum++;
    }
    cout<<sum;
}
