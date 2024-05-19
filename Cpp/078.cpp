#include<cstdio>
#include<cstring>
#include<iostream>
#include<vector>
#define MAX 1000000
using namespace std;

vector<int> v;
int ans[MAX+1];

void pre()
{
    ans[0]=1;
    ans[1]=1;
    for(int i=1;i<=MAX;i++)
    {
        v.push_back(i*(3*i-1)/2);
        v.push_back((-i)*(3*(-i)-1)/2);
    }
}

int solve(int k)
{
    if(ans[k] != 0) return ans[k];
    int x = 0, index = 0, ret = 0, flag = 0;
    //cout<<"Hi k = "<<k<<endl;
    while(1)
    {
        x = v[index++];
        if(k-x < 0) break;
        // saving only last 6 digits because that's all we need
        if(ans[k-x] == 0) ans[k-x] = solve(k-x)%MAX;
        if(flag == 0 || flag == 1) ret+=ans[k-x];
        else ret-=ans[k-x];
        flag++;
        flag%=4;
    }
    //cout<<"ret for k = "<<k<<" = "<<ret<<endl;
    ans[k] = ret%MAX;
    return ret%MAX;
}

int main()
{
    pre();
    //cout<<solve(15)<<endl;
    //for(int i = 0; i<=15;i++) cout<<ans[i]<<"\t";
    for(int i=1;i<=MAX;i++)
    {
        if(solve(i) == 0)
        {
            cout<<i<<endl;
            //cout<<solve(i);
            return 0;
        }
    }
    return 0;
}
