// ***************** DOESN'T WORK ******************

#include<cstdio>
#include<iostream>
#include<cmath>
#include<algorithm>
#include<vector>
using namespace std;
typedef long long ll;

vector<ll> squares;

bool is_square(int n)
{
    // return (int)(sqrt(n))*(int)(sqrt(n)) == n;
    return binary_search(squares.begin(), squares.end(), ll(n));
}

void calc_squares()
{
    for(ll i=1; i<=10000000;i++) squares.push_back(i*i);
}

int main()
{
    calc_squares();
    ll x,y,ans,D,max=0;
    for(D=2; D<=1000; D++)
    {
        if(is_square(D)) continue;
        for(y=1;; y++)
        {
            if(is_square(1+D*y*y))
            {
                x = sqrt(1 + D*y*y);
                //printf("x=%lld\n",x);
                if(x>max)
                {
                    max=x;
                    printf("max=%lld\n",max);
                    printf("y=%lld\n",y);
                    ans=D;
                }
                break;
            }
        }
    }
    cout<<ans;
    return 0;
}
