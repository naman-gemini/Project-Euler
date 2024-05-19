#include<cstdio>
#define MOD 10000000000ll
using namespace std;

typedef unsigned long long ll;

ll modular_pow(ll base,ll exponent)
{
    ll result=1;
    while(exponent>0)
    {
        if((exponent&1)==1)
        {
            result=(result*base)%MOD;
        }
        exponent = exponent >> 1;   //divide by 2
        base=(base*base)%MOD;
    }
    return result;
}

int main()
{
    ll sum=0;
    ll i;
    for(i=1;i<=1000;i++)
    {
        sum=(sum+modular_pow(i,i))%MOD;
    }
    printf("%llu\n",sum);
}
