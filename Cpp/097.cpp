#include<cstdio>
#include<iostream>
#define mod 1000000000LL
typedef unsigned long long ll;
using namespace std;

ll modular_pow(ll base,ll exponent)
{
    ll result=1;
    while(exponent>0)
    {
        if((exponent&1)==1)
        {
            result=(result*base)%mod;
        }
        exponent = exponent >> 1;   //divide by 2
        base=(base*base)%mod;
    }
    return result;
}

int main()
{
	cout<<((28433*modular_pow(2,7830457))%mod+1);
}
