#include<cstdio>
#include<iostream>
#include<algorithm>
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

int value(vector<int> &v)
{
    int val = 0, mul = 1;
    for(int i=v.size()-1; i>=0; i--)
    {
        val += v[i]*(mul);
        mul *= 10;
    }
    return val;
}

bool check_right(vector<int> &v)
{
    // copying vector v as its pass by reference
    vector<int> temp(v);
    while(temp.size() > 1)
    {
        temp.pop_back();
        if(!prime[value(temp)]) return false;
    }
    return true;
}

bool check_left(vector<int> &v)
{
    vector<int> temp(v);
    while(temp.size() > 1)
    {
        reverse(temp.begin(), temp.end());
        temp.pop_back();
        reverse(temp.begin(), temp.end());
        if(!prime[value(temp)]) return false;
    }
    return true;
}

bool solve(int a)
{
    if(!prime[a]) return false;
    vector<int> v;
    while(a)
    {
        v.push_back(a%10);
        a /= 10;
    }
    reverse(v.begin(), v.end());
    if(check_left(v) && check_right(v)) return true;
    return false;
}

int main()
{
    init();
    precal();
    int sum = 0, cnt = 0;
    for(int i=10;i<MAX;i++)
    {
        if(solve(i))
        {
            sum += i;
            cnt++;
        }
    }
    cout<<cnt<<endl;
    cout<<sum;
}
