#include<cstdio>
#include<iostream>
#include<cmath>
using namespace std;

#define LEN_MAX 100
#define WIDTH_MAX 100
#define MAX 2000000

// selecting 2 horizontal lines from (length + 1) * selecting 2 vertical lines from (width + 1) 

int main()
{
	int number_of_rectanges;
	int d = MAX;
	int a, b;
	for(int l=2;l<LEN_MAX;l++)
	{
		for(int w=2;w<WIDTH_MAX;w++)
		{
			number_of_rectanges = (l*(l+1))/2;
			number_of_rectanges *= (w*(w+1))/2;
			if(abs(number_of_rectanges - MAX) < d)
			{
				d = abs(number_of_rectanges - MAX);
				a = l;
				b = w;
			}
		}
	}
	cout << a << " " << b <<endl;
	cout << a*b << endl;
}
