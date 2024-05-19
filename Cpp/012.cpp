#include<cstdio>
#include<iostream>
using namespace std;
typedef long long ll;

ll div(ll a)
{
    ll cnt=1;
    for(ll i=2;i<=a;i++)
    {
        ll c=0;
        while(a%i==0)
        {
            c++;
            a/=i;
        }
        cnt*=(c+1);
    }
    return cnt;
}

ll tri(ll a)
{
    return (a*(a+1))/2;
}

int main()
{
    for(ll i=1;;i++)
    {
        if(div(tri(i))>=500)
        {
            printf("%lld\n",tri(i));
            return 0;
        }
    }
}
