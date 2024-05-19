#include<cstdio>
#include<iostream>
#include<cmath>
using namespace std;

int main()
{
    for(int i=1;i<=1000;i++)
    {
        for(int j=1;j<=1000;j++)
        {
            if(i + j + sqrt(i*i+j*j) == 1000.0)
            {
                printf("%d %d\n",i,j);
                break;
            }
        }
    }
}
