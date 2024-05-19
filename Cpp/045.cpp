#include <cstdio>
#include <iostream>
#include <algorithm>
#include <vector>
#define MAX 70000
#define MIN 285
using namespace std;

typedef unsigned long long ll;

vector<ll> t, p, h;

void generate_series()
{
	for(int n=1;n<=MAX;n++)
	{
		t.push_back((ll)n*(n+1)/2);
		p.push_back((ll)n*(3*n-1)/2);
		h.push_back((ll)n*(2*n-1));
	}
}

int main()
{
	generate_series();
	for(int i=MIN;i<MAX;i++)
	{
		if(binary_search(p.begin(), p.end(), t[i]) && binary_search(h.begin(), h.end(), t[i]))
		{
			cout << t[i];
			break;
		}
	}
}