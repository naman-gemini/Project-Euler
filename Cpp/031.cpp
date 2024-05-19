#include <cstdio>
#include <iostream>
using namespace std;

int complexity = 0;

// RECURSIVE SOLUTION
// Returns the count of ways we can sum  S[0...m-1] coins to get sum n
int count( int S[], int m, int n )
{
    complexity++;

    // If n is 0 then there is 1 solution (do not include any coin)
    if (n == 0)
        return 1;

    // If n is less than 0 then no solution exists
    if (n < 0)
        return 0;

    // If there are no coins and n is greater than 0, then no solution exist
    if (m <= 0 && n >= 1)
        return 0;

    // count is sum of solutions (i) including S[m-1] (ii) excluding S[m-1]
    return count( S, m, n-S[m-1] ) + count( S, m - 1, n );
}

int main()
{
    int i, j;
    int arr[] = {1,2,5,10,20,50,100,200};
    int m = sizeof(arr)/sizeof(arr[0]);
    printf("%d ", count(arr, m, 200));
    cout << complexity;
    return 0;
}
