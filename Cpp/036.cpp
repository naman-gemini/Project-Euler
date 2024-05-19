#include<iostream>
#include<string>
#include<sstream>
using namespace std;

string convertInt(int number)
{
   stringstream ss;//create a stringstream
   ss << number;//add number to the stream
   return ss.str();//return a string with the contents of the stream
}

// palindrome check for integer
bool check(int a)
{
    string s=convertInt(a);
    int x=s.size();
    for(int i=0,j=x-1;i<=x/2;i++,j--)
    {
        if(s[i]!=s[j]) return false;
    }
    return true;
}

// palindrome check for string
bool check2(string s)
{
    int x=s.size();
    for(int i=0,j=x-1;i<=x/2;i++,j--)
    {
        if(s[i]!=s[j]) return false;
    }
    return true;
}

string binary(int a)
{
    string s="";
    while(a)
    {
        s+=a%2;
        a/=2;
    }
    return s;
}

int main()
{
    int sum=0;
    for(int i=1;i<1000000;i++)
    {
        if(check(i) && check2(binary(i))) sum+=i;
    }
    cout<<sum;
}
