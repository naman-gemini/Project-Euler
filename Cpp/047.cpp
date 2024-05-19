#include<cstdio>
#include<iostream>
#include<cmath>
#include<vector>
#define MAX 1000000
#define DEBUG(x) printf(#x"=%d\n",x)
using namespace std;

bool prime[MAX];

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

vector<int> prime_factors(int a)
{
    vector<int> v;
    if (a % 2 == 0)
    {
        v.push_back(2);
        while (a % 2 == 0)
        {
            if(prime[a/2] && (a != 4)) v.push_back(a/2);
            a /= 2;
        }
    }
    int b=a;
    for (int i = 3; i*i <= a && a>1; i += 2)
    {
        if (a % i == 0)
        {
            v.push_back(i);
            while (a % i == 0)
            {
                if(prime[a/i] && (i*i !=a)) v.push_back(a/i);
                a /= i;
            }
        }
    }
    return v;
}

int main()
{
    init();
    precal();  
    for (int i = 650;; i++)
    {
        int count = 0;
        vector<int> v = prime_factors(i);
        while (v.size() == 4)
        {
            i++;
            count++;
            if (count == 4)
            {
                cout << i - 4;
                return 0;
            }
            v = prime_factors(i);
        }
    }
}