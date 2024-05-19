#include<cstdio>
#define ll long long
using namespace std;

int digits(ll x)
{
    int ans = 0;
    while(x)
    {
        ans++;
        x/=10;
    }
    return ans;
}

int main()
{
    ll p=1,q=1;
    ll num,den;
    int count = 0;
    for(int i=0;i<1000;i++)
    {
        num = p + 2*q;
        den = p + q;
        p = num;
        q = den;
        printf("%lld/%lld\n",num,den);
        if(digits(num) > digits(den)) count++;
    }
    printf("%d\n",count);
}
