#include<cstdio>
#include<iostream>
#include<string>
#include<sstream>
#include<algorithm>
#define MAX 10000
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

bool anagram(int a)
{
	int d=3330;
	stringstream ss,ss1,ss2;
	ss<<a;
	string s,s1,s2;
	s=ss.str();
	ss1<<(a+d);
	s1=ss1.str();
	ss2<<(a+d+d);
	s2=ss2.str();
	sort(s.begin(),s.end());
	sort(s1.begin(),s1.end());
	sort(s2.begin(),s2.end());
	if(s==s1 && s1==s2) return true;
	else return false;

}

bool check(int a,int b,int c)
{
	if(prime[a] && prime[b] && prime[c] && anagram(a)) return true;
	else return false;
}


int solve()
{
	int d=3330;
	for(int i=1488;i<=3340;i++)
		if(check(i,i+d,i+d+d))
		{
			return i;
		}
	return 0;
}

int main()
{
	init();
	precal();
	cout<<solve();
	return 0;
}