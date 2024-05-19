#include<iostream>
#include<cstdio>
#include<algorithm>
#include<cstring>
#define MAX 1000000
using namespace std;

bool prime[MAX];
int primes[78500];

void init()
{
    prime[1]=false;
    prime[2]=true;
    for(int i=3; i<=MAX; i++)
        if(i%2==0) prime[i]=false;
        else prime[i]=true;
}

void precal()
{
    for(int i=3; i*i<=MAX; i+=2)
    {
        if(prime[i])
        for(int j=i*i; j<=MAX; j+=i)
        {
            prime[j]=false;
        }
    }
}

void fill_primes()
{
    int k=0;
    for(int i=2;i<MAX;i++)
    {
        if(prime[i])
        {
            primes[k]=i;
            k++;
        }
    }
}

// Space Efficient Dynamic Programming
int count(int m, int n )
{
    // table[i] will be storing the number of solutions for
    // value i. We need n+1 rows as the table is consturcted
    // in bottom up manner using the base case (n = 0)
    int table[n+1];

    // Initialize all table values as 0
    memset(table, 0, sizeof(table));

    // Base case (If given value is 0)
    table[0] = 1;

    // Pick all coins one by one and update the table[] values
    // after the index greater than or equal to the value of the
    // picked coin
    for(int i=0; i<m; i++)
        for(int j=primes[i]; j<=n; j++)
            table[j] += table[j-primes[i]];

    return table[n];
}

int solve(int n)
{
    int index = lower_bound(primes,primes+78500,n) - primes;
    if(primes[index] != n) index--;
    return count(index,n);
}

int main()
{
    init();
    precal();
    fill_primes();
    for(int i=2;;i++)
    {
        if(solve(i)>=5000)
        {
            cout<<i;
            return 0;
        }
    }
}
