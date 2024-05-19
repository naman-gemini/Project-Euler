#include<iostream>
#include<sstream>
#include<string>
#include<algorithm>
using namespace std;

string modify(int a)
{
    stringstream ss;
    ss<<a;
    string s=ss.str();
    sort(s.begin(),s.end());
    return s;
}

bool solve(int a)
{
    int b=2*a,c=3*a,d=4*a,e=5*a,f=6*a;
    if(modify(a)==modify(b) && modify(c)==modify(d) && modify(e)==modify(f) && modify(a)==modify(c) && modify(c)==modify(e))
        return true;
    return false;
}

int main()
{
    int i;
    for(i=1;;i++)
    {
        if(solve(i)) break;
    }
    cout<<i;
}
