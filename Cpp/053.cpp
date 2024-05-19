#include<cstdio>
#include<iostream>
#include<cmath>
#define N 105
#define M 1000000
using namespace std;

int arr[N][N];

int solve()
{
    int sum=0;
    for(int i=0;i<N;i++) arr[i][0]=1,arr[i][1]=i;
    for(int i=1;i<=100;i++)
    {
        for(int j=1;j<=i;j++)
        {
            arr[i][j]=arr[i-1][j-1]+arr[i-1][j];
            if(arr[i][j]>=M || arr[i][j]<0)
            {
                sum++;
            }
        }
    }
    return sum;
}

int main()
{
    cout<<solve();
}
