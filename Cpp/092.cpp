#include<cstdio>
#define MAX 10000000
#define ll long long
using namespace std;

ll solve(int i)
{
    int last_dig;
    ll res = 0;
    while(i)
    {
        last_dig = i%10;
        res += last_dig * last_dig;
        i/=10;
    }
    return res;
}

int main()
{
    int count=0;
    ll sq;
    for(int i=1;i<=MAX;i++)
    {
        sq = solve(i);
        while(sq != 89 && sq != 1)
        {
            sq = solve(sq);
        }
        if(sq == 89) count+=1;
        else continue;
    }
    printf("%d\n",count);
    return 0;
}
