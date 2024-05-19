#include<cstdio>
#include<algorithm>
#include<vector>
#include<iostream>
#define MAX 10000
using namespace std;

typedef struct{
    int num;
    int den;
    double val;
} node;

vector<node> v;
vector<node>::iterator it;

bool compare(node a, node b)
{
    return a.val < b.val;
}

int gcd(int a, int b)
{
    while(b) b^=a^=b^=a%=b;
    return a;
}

int main()
{
    node a;
    node current,previous;
    for(int d=2;d<=MAX;d++)
    {
        for(int n=1;n<d;n++)
        {
           if(gcd(n,d) == 1)
           {
               a.num = n;
               a.den = d;
               a.val = double(n)/d;
               v.push_back(a);
           }
        }
    }
    sort(v.begin(),v.end(),compare);
    for(it=v.begin();it!=v.end();it++)
    {
        current = *it;
        if(current.num == 3 && current.den == 7)
        {
            printf("%d/%d\n",previous.num,previous.den);
        }
        previous = current;
    }

    return 0;
}
