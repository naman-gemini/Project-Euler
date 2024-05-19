#include <iostream>
#include <cstdio>
#include <vector>
#include <algorithm>
#define DEBUG(x) printf(#x"=%d\n",x)

using namespace std;

// perform manual division

int check_for_repetition(vector<int> v)
{
	int sz = v.size();
	for(int i=0; i<sz-1; i++)
	{	
		if(v[i] == v.back()) return (sz - i - 1);
	}
	return 0;
}

int cycle_size(int a)
{
	// holds the remainders/dividends
	vector<int> d;
	// r = 10 for decimal positioning
	int r = 10, x, len;
	// this is for extra zeroes
	int cnt = 0;
	// first dividend
	d.push_back(1);
	while(1)
	{
		if(r%a == 0) return 0;
		if(r/a > 0)
		{
			d.push_back(r%a);
			x = check_for_repetition(d);
			if(x>0) return x+cnt;
		}
		else cnt++;
		r %= a;
		r *= 10;
	}
}

int main()
{
	int size, max_size = 0, val;
	for(int i=2; i<1000; i++)
	{
		size = cycle_size(i);
		// printf("i=%d size=%d\n", i, size);
		if(size > max_size) 
		{
			max_size = size;
			val = i;
		}
	}
	cout << val << endl;
	cout << max_size << endl;
}