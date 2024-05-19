#include<cstdio>
#include<iostream>
#include<cmath>
typedef long long ll;
ll const mod = 600851475143;

using namespace std;

int main()
{
	int x = int(sqrt(mod));
  int max = 0;
  ll number = mod;
	for(int i = 2 ; i <= number ; i++)
	{
		while(number % i == 0)
    {
      number /= i;
    }
    if(i > max)
    {
      max = i;
    }
	}
  cout << max << endl;
}
