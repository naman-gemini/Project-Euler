#include <cstdio>
#include <iostream>
using namespace std;

int div_sum(int a)
{
    int sum=0;
    for(int i=1;i<=a/2;i++)
    {
        if(a%i==0) sum+=i;
    }
    return sum;
}

int main()
{
    int sum=0,x;
    for(int i=1;i<=10000;i++)
    {
        x=div_sum(i);
        if(i<x && i==div_sum(x)) sum+=i+x;
    }
    cout<<sum;
}
