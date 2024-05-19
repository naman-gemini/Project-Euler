#include <cstdio>
#include <iostream>
#include <algorithm>
#include <vector>
#define MAX 28123

using namespace std;

vector<int> abundant_numbers;

int div_sum(int a)
{
    int sum=0;
    for(int i=1;i<=a/2;i++)
    {
        if(a%i==0) sum+=i;
    }
    return sum;
}

void calculate_abundant_numbers()
{
    int x;
    for(int i=1; i<=MAX; i++)
    {
        x = div_sum(i);
        if(x>i) abundant_numbers.push_back(i);
    }
}

bool can_express_as_sum_of_two(int a)
{
    // find the index closest to the number a in abundant numbers
    int low = lower_bound(abundant_numbers.begin(), abundant_numbers.end(), a) - abundant_numbers.begin() - 1;
    for(int i=0; i<=low; i++)
    {
        if(binary_search(abundant_numbers.begin(), abundant_numbers.end(), a - abundant_numbers[i])) return true;
    }
    return false;
}

int main()
{
    calculate_abundant_numbers();
    int sum = 0;
    for(int i=1; i<=MAX; i++)
    {
        if(!can_express_as_sum_of_two(i)) sum += i;
    }
    cout << sum << endl;
}
