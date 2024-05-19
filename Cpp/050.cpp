#include<cstdio>
#include<iostream>
#include<vector>
#include<algorithm>
#define DEBUG(x) printf(#x"=%d\n",x)
#define MAX 1000000
using namespace std;

bool prime[MAX];
vector<int> primes;

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

void fill_vector()
{
    for(int i=0;i<MAX;i++)
        if(prime[i]) primes.push_back(i);
}

// find a sub-array primes[i..j] that sums up to a prime number
int solve(int index)
{
    int sz = primes.size();
    int number = primes[index];
    int sum = 0;
    // i means left limit of sub-array
    for(int i=0;i<index-2;i++)
    {
        sum = primes[i];
        // j means right limit of sub-array
        for(int j=i+1;j<index;j++)
        {
            sum += primes[j];
            if(sum == number) return (j-i+1);
            if(sum > number) break;
        }
    }
    return 0;
}

int main()
{
    init();
    precal();
    fill_vector();

    int count, max = 0;

    int sz = primes.size();
    for(int i=0; i<sz; i++)
    {
        count = solve(i);
        if(count > max) max = count;
    }
    cout<<max;
    return 0;
}