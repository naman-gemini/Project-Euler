#include <cstdio>
#include <iostream>
#include <vector>
#include <sstream>
#include <algorithm>

#define DEBUG(x) printf(#x"=%d\n",x)
#define MAX 1000000

using namespace std;

// true means prime
bool prime[MAX+1];
int ans = MAX;


// 1 denotes the non repeating digit
// 0 denotes repeating digit
// last digit has to be non repeating
int five_digit_patterns[4][5] = {{1, 0, 0, 0, 1},
								 {0, 1, 0, 0, 1},
								 {0, 0, 1, 0, 1},
								 {0, 0, 0, 1, 1}};

int six_digit_patterns[10][6] = {{1, 1, 0, 0, 0, 1},
							     {1, 0, 1, 0, 0, 1},
							     {1, 0, 0, 1, 0, 1},
							     {1, 0, 0, 0, 1, 1},
							     {0, 1, 1, 0, 0, 1},
							     {0, 1, 0, 1, 0, 1},
							     {0, 1, 0, 0, 1, 1},
							     {0, 0, 1, 1, 0, 1},
							     {0, 0, 1, 0, 1, 1},
							     {0, 0, 0, 1, 1, 1}};

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
		for(int j=i*i; j<= MAX; j+=i) prime[j] = false;
	}
}

bool check_repeating(int a)
{
	int digit = a%10;
	while(a)
	{
		if(digit != a%10) return false;
		digit = a%10;
		a /= 10;
	}
	return true;
}

bool check_sum(int a)
{
	int sum = 0;
	while(a)
	{
		sum += a%10;
		a /= 10;
	} 
	if(sum%3 == 0) return true;
	return false;
}

int value(int *arr, int sz)
{
	int sum = 0, ret = 1;
	for(int i=sz-1;i>=0;i--)
	{
		sum += arr[i]*ret;
		ret *= 10;
	}
	return sum;
}

int* generate_number_from_pattern(int *pattern, int *arr, int a, int j, int sz)
{
	for(int i=sz-1;i>=0;i--)
	{
		if(pattern[i] == 1)
		{
			arr[i] = (a%10);
			a /= 10;
		}
		else
		{
			arr[i] = j;
		}
	}
	return arr;
}

void print_array(int *arr)
{
	int sz = sizeof(arr)/sizeof(arr[0]);
	for(int i=0;i<6;i++) cout<<arr[i]<<",";
	cout<<endl;
}

int get_family_size(int *pattern, int a, int repeating_digit, int sz)
{
	int *number = (int*)malloc(sz*sizeof(int));;
	int family_size = 1;
	for(int i=repeating_digit + 1; i<=9; i++)
	{
		number = generate_number_from_pattern(pattern, number, a, i, sz);
		if(prime[value(number, sz)]) family_size++;
	}
	return family_size;
}

void replace_and_count(int a)
{
	int count;
	// solve for 5 digits
	if(a < 100)
	{
		for(int i=0;i<4;i++)
		{
			int *pattern = five_digit_patterns[i];
			count = 0;
			// print_array(pattern);
			// j being the repeating digit (can be from 0-2) as we're finding first number in prime family
			for(int j=0;j<=2;j++)
			{
				int *number = (int*)malloc(5*sizeof(int));
				number = generate_number_from_pattern(pattern, number, a, j, 5);
				// ignore numbers with leading zeroes
				if(number[0] == 0 && j == 0) continue;
				// print_array(number);

				int family_size = get_family_size(pattern, a, j, 5);
				if(family_size == 8)
				{
					cout<<value(number, 5);
					if(ans > value(number, 5)) ans = value(number, 5);
				}
			}
		}
	}
	// solve for 6 digits
	else
	{
		for(int i=0;i<10;i++)
		{
			int *pattern = six_digit_patterns[i];
			// print_array(pattern);
			// j being the repeating digit (can be from 0-2) as we're finding first number in prime family
			for(int j=0;j<=2;j++)
			{
				int *number = (int*)malloc(6*sizeof(int));
				number = generate_number_from_pattern(pattern, number, a, j, 6);
				// ignore numbers with leading zeroes
				if(number[0] == 0 && j == 0) continue;
				// print_array(number);

				int family_size = get_family_size(pattern, a, j, 6);
				if(family_size == 8 && ans > value(number, 6)) ans = value(number, 6);
			}
		}
	}
}

void solve(int a)
{
	// a disintegrates into digits of non repeating numbers

	// return false if last digit is even (the whole number has to be prime)
	// and last digit of a is supposed to be last digit of whole number
	if((a%10)%2 == 0 || a%10 == 5) return;
	// return false if a has repeating digits
	if(check_repeating(a)) return;
	// return false if sum of non repeating digits%3 is 0
	if(check_sum(a)) return;
	replace_and_count(a);
}

int main()
{
	init();
	precal();
	// with some analysis it can be identified that:
	// 1) the numbers have to be atleast 5 digits long
	// 2) should have 3 repeating digits (2 or 4 won't fit, as atleast 3 would be divisible by 3 from the set of 10) 
	// 3) (sum of rest of digits, that are not repeated)%3 should be 1 or 2 (make a chart and you'll understand)
	// 4) last digit cannot be replaced as the whole number has to be prime (even digits can't be at last position)
	// 5) repeating digits of 1st member of the family can be 0, 1 or 2 only

	// solve for 5 and 6 digit numbers and above constraints
	// iterate from 10 to 999 (selecting the non repeating 2,3 digits)
	for(int i=100; i<1000; i++)
	{
		solve(i);
	}

	cout<<ans<<endl;
}