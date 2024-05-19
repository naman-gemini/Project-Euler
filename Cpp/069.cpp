#include<cstdio>
#include<iostream>
#include<algorithm>
#include<string>
#include<vector>
#define MAX 1000000
#define DEBUG(x) printf(#x"=%d\n",x)
using namespace std;

// Euler's Totient Function

bool arr[MAX+1];
vector<int> primes;
//false is non prime

void init()
{
    for(int i=0;i<=MAX;i++) arr[i]=true;
}

void sieve()
{
    for(int i=2;i*i<=MAX;i++)
    {
        int x = 2*i;
        while(x <= MAX)
        {
            if(arr[x]) arr[x]=false;
            x+=i;
        }
    }
}

void calc_primes()
{
    for(int i=2;i<=MAX;i++)
    {
        if(arr[i]) primes.push_back(i);
    }
}

//fast
int binary_gcd(int a, int b)
{
    while(b) b^=a^=b^=a%=b;
    return a;
}

bool isprime(int n)
{
    return arr[n];
}

int phi(int n)
{
  // Base case
  if ( n < 2 )
    return 0;

  // Lehmer's conjecture
  if ( isprime(n) )
    return n-1;

  // Even number?
  if ( n & 1 == 0 ) {
    int m = n >> 1;
    return !(m & 1) ? phi(m)<<1 : phi(m);
  }

  // For all primes ...
  for ( vector<int>::iterator p = primes.begin();p != primes.end() && *p <= n; ++p )
  {
    int m = *p;
    if ( n % m  ) continue;

    // phi is multiplicative
    int o = n/m;
    int d = binary_gcd(m, o);
    return d==1? phi(m)*phi(o) : phi(m)*phi(o)*d/phi(d);
  }
}

int main()
{
    init();
    sieve();
    //for(int i=0;i<100;i++) printf("%d=>%d\n",i,arr[i]);
    calc_primes();
    //for(int i=0;i<100;i++) printf("%d\n",primes[i]);
    double max_ratio=0,current_ratio;
    int ans;
    for(int i=2;i<=MAX;i++)
    {
        //DEBUG(phi(i));
        current_ratio = double(i)/phi(i);
        //printf("current_ratio for n = %d is %lf\n",i,current_ratio);
        if(current_ratio > max_ratio) {max_ratio = current_ratio, ans = i;};
    }
    printf("%lf %d\n",max_ratio,ans);
	return 0;
}
