#include<cstdio>
#include<iostream>
#include<algorithm>
#include<string>
#include<vector>
#include<cmath>
#define MAX 1500000
#define DEBUG(x) printf(#x"=%d\n",x)
using namespace std;

int arr[2*MAX];

int gcd(int a, int b)
{
    while(b) b^=a^=b^=a%=b;
    return a;
}

int main()
{
    int m,n,a,b,c,p;
    int ans = 0;
    int upperbound = sqrt(MAX/2);
    for(m=2; m<upperbound; m++)
    {
        for(n=1; n<m; n++)
        {
            if((gcd(m,n)==1 && (m-n)%2==1))
            {
                a = m*m - n*n;
                b = 2*m*n;
                c = m*m + n*n;
                p = a+b+c;
                while(p<=MAX)
                {
                    if(arr[p]==0 || arr[p]==1) arr[p]++;
                    p+=(a+b+c);
                }
            }
        }
    }
    for(int i=0; i<=MAX; i++) if(arr[i] == 1) ans++;
    cout<<ans;
    return 0;
}
