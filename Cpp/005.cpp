#include<cstdio>
#include<iostream>
using namespace std;
typedef long long ll;

ll gcd(ll a,ll b)
{
    while(b!=0)
    {
        ll temp=b;
        b=a%b;
        a=temp;
    }
    return a;
}

int main()
{
    ll a=1;
    ll lcm;
    for(ll b=2;b<=20;b++)
    {
        lcm=a*b/gcd(a,b);
        a=lcm;
    }
    cout<<lcm;
}
