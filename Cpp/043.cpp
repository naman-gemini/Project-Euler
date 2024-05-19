#include<cstdio>
#include<iostream>
#include<algorithm>
typedef unsigned long long ll;
using namespace std;

ll val(int arr[])
{
    ll sum=0;
    for(int i=9,x=1;i>=0;i--,x*=10) sum+=arr[i]*(ll)(x);
    return sum;
}

bool check(int d[])
{
    if(d[0]==0) return false;
    if(d[3]%2!=0) return false;
    if((d[2]+d[3]+d[4])%3!=0) return false;
    if(d[5]!=5) return false;
    ll temp=d[7]*100+d[8]*10+d[9];
    if(temp%17!=0) return false;
    temp=temp/10+d[6]*100;
    if(temp%13!=0) return false;
    temp=temp/10+d[5]*100;
    if(temp%11!=0) return false;
    temp=temp/10+d[4]*100;
    if(temp%7!=0) return false;
    return true;
}

ll solve()
{
    ll sum=0;
    int arr[10]={0,1,2,3,4,5,6,7,8,9};
    while(next_permutation(arr,arr+10))
        if(check(arr)) sum+=val(arr);
    return sum;
}

int main()
{
    cout<<solve();
}
