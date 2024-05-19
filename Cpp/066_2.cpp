//
// Problem: Solving Pell's equation
// Algo: Chakravala Method by Bhrahmgupta
// Refer wiki article https://en.wikipedia.org/wiki/Chakravala_method

#include <cstdio>
#include <iostream>
#include <cmath>
#include <algorithm>
#include <vector>
using namespace std;
typedef long long ll;

vector<int> squares;

void generate_squares()
{
	for(int i=1;i<=40;i++) squares.push_back(i*i);
}

bool is_square(int n)
{
	return binary_search(squares.begin(), squares.end(), n);
}

ll closest_square(int D)
{
	int low = lower_bound(squares.begin(), squares.end(), D) - squares.begin();
	ll a = (ll)(sqrt)(abs(squares[low] - D) > abs(squares[low-1] - D) ? squares[low-1] : squares[low]);
	return a;
}

ll find_m(ll a, ll b, ll D, ll k)
{
	int min = D, min_m = 1;
	for(ll m = 1;; m++)
	{
		if((a + b*m) % k == 0 && abs(m*m - D) < min)
		{
			min = abs(m*m - D);
			min_m = m;
		}
		if(abs(m*m - D) > min) break;
	}
	return min_m;
}

ll chakravala(int D)
{
	// composite solution:
	// from (a,b,k) and (m, 1, m^2 - D)
	// a = (a*m + D*b) / |k|
	// b = (a + b*m) / |k|
	// k = (m^2 - D) / k
	//
	double a, b, k, m;
	b = 1;
	a = closest_square(D);
	// cout<<"D: "<<D<<" a: "<<a<<endl;
	k = a*a - D;
	if(k == 1) return a;
	while(k != 1 || k != -1)
	{
		cout << "a: " << a << " b: "<<b<< " k: "<<k<<endl;
		if(k == 0) cout << "oh fuck"<<endl;
		// ll arr_a[3] = {a, D*b, abs(k)};
		// ll arr_b[3] = {a, b, abs(k)};
		// ll arr_k[3] = {1, D, k};

		// find m so that absolute value of m^2 - D is min and k divides a + b*m
		m = find_m(a, b, D, k);
		a = abs((a*m + D*b) / k);
		b = abs((a + b*m) / k);
		k = (m*m - D) / k;
	}
	if(k == -1) return (ll)abs(a*a + D*b*b);
	return (ll)(a);
}


int main()
{
	// a^2 - D*b^2 = k
	// minimise k to 1
	generate_squares();
	cout<<chakravala(13);
	return 0;
	ll a, ans = 0;
	for(int D = 2; D <= 1000; D++)
	{
		if(is_square(D)) continue;
		a = chakravala(D);
		if(a > ans) ans = a;
	}
	cout<<ans<<endl;
}