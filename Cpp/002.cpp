#include<cstdio>
#include<iostream>

using namespace std;

int main()
{
  int sum=0;
  int a=1,b=2,c=0;
  while(c<=4000000)
  {
    c=a+b;
    a=b;
    b=c;
    if(c%2==0) sum+=c;
  }
  cout<<sum+2<<endl;
}
