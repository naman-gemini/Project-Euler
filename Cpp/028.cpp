#include <cstdio>
#include <iostream>
using namespace std;

// used https://oeis.org/ to find sequence formula on diagonals

int main()
{
    int sum=0;
    for(int x=2; x<=8; x+=2)
    {
        int val=1;
        int p=x;
        for(int i=1; i<=500; i++)
        {
            val += p;
            p += 8;
            sum += val;
        }
    }
    cout<<sum+1;
}
