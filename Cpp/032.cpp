#include <cstdio>
#include <iostream>
#include <vector>
#include <set>
using namespace std;

int arr[10];
set<int> s;

void init()
{
    for(int i=1;i<10;i++)
        arr[i]=0;
}

// checks if a digit is repeated in the number a
int check(int a)
{
    while(a)
    {
        if(arr[a%10]==0)
        {
            arr[a%10]=1;
            a/=10;
        }
        else return 0;
    }
    return 1;
}

// checks if multiplicand, multiplier, and product is 1 through 9 pandigital
int cond()
{
    for(int i=1;i<10;i++)
    {
        if(arr[i]==0) return 0;
    }
    return 1;
}

// check if the product has already been calculated
bool cond2(int a)
{
    if(s.find(a)!=s.end()) return true;
    else return false;
}

int main()
{
    int sum=0;
    for(int i=1;i<100;i++)
    {
        for(int j=i;j<=2000;j++)
        {
           init();
           if(!check(i)) continue;
           if(!check(j)) continue;
           if(!check(i*j)) continue;
           if(cond() && !cond2(i*j))
           {
               printf("%d %d %d\n",i,j,i*j);
               for(int k=1;k<10;k++)
               {
                   printf("%d ",arr[k]);
               }
               printf("\n");
               s.insert(i*j);
               sum+=i*j;
           }
        }
    }
    cout<<sum;
}
