#include<cstdio>
#include<iostream>
#include<algorithm>
#include<cstring>
#include<vector>
#define MAX 1000000
#define DEBUG(x) printf(#x"=%d\n",x)
using namespace std;

int fact[10]={1};
bool arr[MAX*10];
vector<int> record;

void pre()
{
    for(int i=1;i<10;i++) fact[i]=fact[i-1]*i;
}

int fact_sum(int n)
{
    int ret = 0;
    while(n)
    {
        ret+=fact[n%10];
        n/=10;
    }
    return ret;
}

int solve(int n)
{
    int ans = 1;
    //memset(arr,false,MAX*10);
    //for(int i=0;i<MAX*10;i++) arr[i]=false;
    arr[n] = true;
    while(1)
    {
        record.push_back(n);
        n = fact_sum(n);
        //DEBUG(n);
        if(arr[n]) break;
        else arr[n] = true;
        ans++;
    }
    for(int i=0;i<record.size();i++) arr[record[i]]=false;
    record.clear();
    return ans;
}

int main()
{
    pre();
    int ans = 0;
    for(int i=1;i<=MAX;i++)
    {
        //cout<<i<<" = "<<solve(i)<<endl;
        if(solve(i) == 60) ans++;
    }
    cout<<ans;
	return 0;
}
