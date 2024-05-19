#include<cstdio>
#include<iostream>
#include<vector>
#include<algorithm>
#define MAX 1000000
using namespace std;

int main()
{
    const int a = 3;
    const int b = 7;
    int p,q;
    double ans = -1;
    double fraction;
    int num,den;

    for(q=MAX;q>=2;q--)
    {
        p = (a*q-1)/b;
        fraction = double(p)/q;
        if (fraction > ans)
        {
            ans = fraction;
            num = p;
            den = q;
        }
    }

    printf("%d/%d\n",num,den);
    return 0;
}
