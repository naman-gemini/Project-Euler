#include <cmath>
#include <iostream>
#define M 1000000
using namespace std;

int sum(int a)
{
    int ans=0,b;
    while(a)
    {
        b=a%10;
        ans+=pow(b,5);
        a/=10;
    }
    return ans;
}

int main()
{
    int ans=0;
    for(int i=10;i<M;i++)
    {
        if(sum(i)==i)
            cout<<i<<endl,ans+=i;
    }
    cout<<ans;
}
