#include<cstdio>
#include<string>
#include<iostream>
#include<sstream>
using namespace std;

string convertInt(int number)
{
   stringstream ss;//create a stringstream
   ss << number;//add number to the stream
   return ss.str();//return a string with the contents of the stream
}

bool check(int a)
{
    string p=convertInt(a);
    for(int i=0,j=p.size()-1;i<p.size();i++,j--)
    {
        if(p[i]!=p[j]) return false;
    }
    return true;
}

int main()
{
    int ans=0;
    for(int i=999;i>=100;i--)
    {
        for(int b=999;b>=100;b--)
        {
            if(check(i*b))
            {
                if(i*b>ans) ans=i*b;
            }
        }
    }
    cout<<ans;
}
