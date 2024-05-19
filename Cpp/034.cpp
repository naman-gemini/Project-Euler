#include<iostream>
#define M 2540160
using namespace std;

int arr[]={1,1,2,6,24,120,720,5040,40320,362880};

bool sum(int a)
{
    int ans=0,b,c=a;
    while(a)
    {
        b=a%10;
        ans+=arr[b];
        a/=10;
    }
    if(c==ans) return true;
    else return false;
}

int main()
{
    int ans=0;
    for(int i=5;i<M;i++)
    {
        if(sum(i)) ans+=i;
    }
    cout<<ans;
}
