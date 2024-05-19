#include<iostream>
#include<climits>
#include<sstream>
#include<cstdio>
#include<string>
#include<vector>
#include<algorithm>
#include<cmath>
#define MAX 30000
#define DEBUG(x) cout<<#x<<"="<<x<<endl
using namespace std;

typedef long long ll;

bool prime[MAX];
vector<int> v;

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

void fill_vector()
{
    for(int i=2;i<=MAX;i++)
    {
        if(prime[i]) v.push_back(i);
    }
}

string ntos(ll n)
{
    stringstream s;
    s << n;
    return s.str();
}

ll ston(string s)
{
    ll value = 0;
    ll base = 1;
    for(int i=s.size()-1;i>=0;i--)
    {
        value += (s[i]-'0')*base;
        base*=10;
    }
    return value;
}

bool isprime(ll n)
{
    if(n%2 == 0) return false;
    if(n%6 == 2 || n%6 == 3 || n%6 == 4 || n%6 == 0) return false;
    int root = sqrt(n);
    for(int i=3;i<=root;i+=2)
    {
        if(n%i==0) return false;
    }
    return true;
}

bool resolve(ll a,ll b)
{
    bool c,d;
    if (a<MAX) c = prime[a];
    else c = isprime(a);
    if(b<MAX) d = prime[b];
    else d = isprime(b);
    //cout<<c<<endl;
    //cout<<d<<endl;
    return c&d;
}

bool solve(int a,int b)
{
    ll first = ston(ntos(a)+ntos(b));
    ll second = ston(ntos(b)+ntos(a));
    return resolve(first,second);
}

int main()
{
    init();
    precal();
    fill_vector();
    int result = 1000000000;
    //cout<<v.size()<<endl;
    int last=v.size();
    int a,b,c,d,e;
    for(a=0;a<last;a++)
    {
        if(v[a]*5 > result) break;
        //DEBUG(v[a]);
        for(b=a+1;b<last;b++)
        {
            if(v[a] + v[b]*4 > result) break;
            if(!solve(v[a],v[b])) continue;
            for(c=b+1;c<last;c++)
            {
                if(v[a] + v[b] + v[c]*3 > result) break;
                if(!solve(v[a],v[c]) || !solve(v[b],v[c])) continue;
                for(d=c+1;d<last;d++)
                {
                    if(v[a] + v[b] + v[c] + v[d]*2 > result) break;
                    if(!solve(v[a],v[d]) || !solve(v[b],v[d]) || !solve(v[c],v[d])) continue;
                    for(e=d+1;e<last;e++)
                    {
                        if(v[a] + v[b] + v[c] + v[d] + v[e] > result) break;
                        if(!solve(v[a],v[e]) || !solve(v[b],v[e]) || !solve(v[c],v[e]) || !solve(v[d],v[e])) continue;
                        if(v[a]+v[b]+v[c]+v[d]+v[e] < result)
                        {
                            result = v[a] + v[b] + v[c] + v[d] + v[e];
                            printf("%d + %d + %d + %d + %d = %d\n", v[a], v[b], v[c], v[d], v[e], result);
                        }
                    }
                }
            }
        }

    }
    printf("%d\n",result);
    return 0;
}
