#include<iostream>
#include<string>
#include<sstream>
using namespace std;

int main()
{
    string s=".";
    stringstream ss;
    for(int i=1;i<=1000000;i++)
    {
        ss<<i;
        s+=ss.str();
        ss.str(""); //clearing stream
    }
    int p=1;
    char c;
    for(int i=1;i<=1000000;i*=10)
    {
        p*=(s[i]-'0');
    }
    cout<<p;
}
