#include<iostream>
#include<algorithm>
#include<cstdio>
using namespace std;
#define N 80 

int main()
{
 freopen("matrix.txt","r",stdin);
 long long mat[N][N];
 long long sum[N][N];
 char dummy;
 for(int i=0;i<N;i++)
   for(int j=0;j<N;j++)
   {
     cin >> mat[i][j];
     if(j < N-1) cin >> dummy;
     sum[i][j] = mat[i][j];
   }	
   // Start from column before the right most
   for(int c=N-2;c>=0;c--)
   {
     for(int r = 0; r < N; r ++)
     {
         // Initialize with result from right
       sum[r][c] = mat[r][c] + sum[r][c+1];

         // Look up
       long long acc = mat[r][c];
       for(int rr = r-1; rr >=0 ; rr--)
       {
        acc += mat[rr][c];
        sum[r][c] = min(sum[r][c],acc + sum[rr][c+1]);
      }

         // Look down
      acc = mat[r][c];
      for(int rr = r+1; rr <N ; rr++)
      {
        acc += mat[rr][c];
        sum[r][c] = min(sum[r][c],acc + sum[rr][c+1]);
      }
    }
  }	

  long long res = sum[0][0];
  for(int r=1;r<N;r++) res = min(res,sum[r][0]);
   cout << res << endl;
 fclose(stdin);
 return 0;
}