#include<cstdio>
#include<iostream>
#include<sstream>
#include<cmath>
#include<string>
#include<cstdlib>
using namespace std;

string convert(int a)
{
    stringstream ss;
    ss<<a;
    return ss.str();
}

bool pandigital(string s)
{
    int arr[10];
    for(int i=0;i<=9;i++) arr[i]=0;

    for(int i=0;i<9;i++)
    {
        arr[s[i]-'0']=1;
    }
    int sum=0;
    for(int i=1;i<=9;i++)
    {
        sum+=arr[i];
    }
    if(sum==9) return true;
    else return false;
}

int value(string s)
{
    int sum=0;
    for(int i=8,x=1;i>=0;i--,x*=10)
        sum+=(s[i]-'0')*x;
    return sum;
}

int main()
{
    int mx=0;
    for(int a=1;a<=50000;a++)
    {
        string s="";
        for(int b=1;b<=9;b++)
        {
            int c=a*b;
            s+=convert(c);
            if(s.size()>9) break;
            else if(s.size()==9 && pandigital(s))
            {
                if(value(s)>mx) mx=value(s);
            }
            else continue;
        }
    }
    cout<<mx;
}
