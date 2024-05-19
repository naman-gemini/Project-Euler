#include<cmath>
#include<iostream>
using namespace std;

int main()
{
    int a,b,p,ret2;
    int ret=0;
    for(p=120; p<=1000; p++)
    {
        int ans=0;
        for(a=1; a<=p-1; a++)
        {
            for(b=1; b<=p-1; b++)
            {
                int c=p-a-b;
                if(a*a+b*b==c*c) ans++;
            }
        }
        if(ans>ret)
        {
            ret=ans;
            ret2=p;
        }
    }
    cout<<ret2;
}
