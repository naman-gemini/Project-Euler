#include<iostream>
#include<cmath>
using namespace std;

double cancel(int a,int b)
{
    int p=a/10,q=a%10,r=b/10,s=b%10;
    if(p==r) return (double)(q)/s;
    else if(q==r) return (double)(p)/s;
    else if(p==s) return (double)(q)/r;
    else if(q==r) return (double)(p)/s;
    else return 0.0;
}

int main()
{
    int num,den;
    double prod=1;
    for(int a=1;a<99;a++)
    {
        for(int b=a+1;b<=99;b++)
        {
            double c=(double)(a)/b;
            double d=cancel(a,b);
            if(c==d) prod*=c;
        }
    }
    cout<<prod;
}
