#include<cstdio>
#include<iostream>
#include<algorithm>
#include<string>
#include<vector>
#include<fstream>
#define MAX 80
#define DEBUG(x) printf(#x"=%d\n",x)
using namespace std;

int arr[85][85];

void padding()
{
    for(int i=0;i<85;i++)
    {
        arr[i][0] = 10000000;
        arr[0][i] = 10000000;
    }
}

void solve()
{
    for(int i=1;i<=MAX;i++)
    {
        for(int j=1;j<=MAX;j++)
        {
            if(i==1 && j==1) continue;
            arr[i][j] += min(arr[i-1][j],arr[i][j-1]);
        }
    }
}

int main()
{
    char dummy;
    padding();
    ifstream file("matrix.txt");
    //ofstream file2("matrix_result.txt");
    // freopen("matrix_result.txt","w",stdout);

    for(int i=1;i<=MAX;i++)
    {
        for(int j=1;j<=MAX;j++)
        {
            file>>arr[i][j];
            if(j!=MAX) file>>dummy;
        }
    }

    // for(int i=0;i<=MAX;i++)
    // {
    //     for(int j=0;j<=MAX;j++)
    //     {
    //         printf("%d ",arr[i][j]);
    //     }
    //     printf("\n");
    // }
    solve();

    // printf("After solving\n\n");

    // for(int i=0;i<=MAX;i++)
    // {
    //     for(int j=0;j<=MAX;j++)
    //     {
    //         printf("%d ",arr[i][j]);
    //     }
    //     printf("\n");
    // }

    printf("%d\n",arr[MAX][MAX]);
    // fclose(stdout);
	return 0;
}