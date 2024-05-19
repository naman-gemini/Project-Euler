#include<cstdio>
#include<iostream>
#include<algorithm>
#include<string>
#include<vector>
#include<fstream>
#define MAX 20
#define DEBUG(x) printf(#x"=%d\n",x)
using namespace std;
typedef long long ll;

ll arr[MAX+1][MAX+1];

// Combinations solution: (2n)C(n) => (m+n)C(n) generic

void padding()
{
    for(int i=0;i<=MAX;i++)
    {
        for(int j=0;j<=MAX;j++)
        {
            arr[i][MAX] = 1;
            arr[MAX][j] = 1;
        }
    }
}

int main()
{
    padding();
    for(int i=MAX-1;i>=0;i--)
    {
        for(int j=MAX-1;j>=0;j--)
        {
            arr[i][j] = arr[i+1][j] + arr[i][j+1];
        }
    }
    cout<<arr[0][0];
	return 0;
}
