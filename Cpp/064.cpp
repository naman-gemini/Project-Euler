#include<cstdio>
#include<vector>
#include<iostream>
#include<algorithm>
#include<cmath>
#define DEBUG(x) cout<<#x<<" = "<<x<<endl
#define MAX 10000
using namespace std;

// Refer to this
// theory: http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/cfINTRO.html#section1
// code: http://www.mathblog.dk/project-euler-continued-fractions-odd-period/

int main()
{
    int ans = 0;
    for(int S=1; S<=MAX; S++)
    {
        int m = 0;
        int d = 1;
        int a0 = sqrt(S);
        if(a0 * a0 == S) continue;
        int a = a0;
        int period=0;
        while(1)
        {
            m = d*a - m;
            d = (S - m*m)/d;
            a = (a0 + m)/d;
            period++;
            if(a == 2*a0) break;
        }
        if(period%2==1) ans++;
    }
    cout<<ans;
    return 0;
}
