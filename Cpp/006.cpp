#include<cstdio>
#include<iostream>
using namespace std;
typedef long long ll;

int main()
{
    ll sum1=0,sum2=0;
    for(ll i=1;i<=100;i++)
    {
        sum1+=i*i;
        sum2+=i;
    }
    cout<<sum2*sum2-sum1;
}
