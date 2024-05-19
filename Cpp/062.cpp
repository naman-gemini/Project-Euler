#include<cstdio>
#include<iostream>
#include<algorithm>
#include<string>
#include<vector>
#include<set>
#include<map>
#define ll long long
#define DEBUG(x) printf(#x"=%lld\n",x)
using namespace std;

map<ll,pair<int,int> > mymap;
vector<ll> v;

ll biggest_permutation(ll a)
{
    while(a)
    {
        v.push_back(a%10);
        a/=10;
    }
    ll ans = 0;
    ll base = 1;
    sort(v.rbegin(),v.rend());
    for(int i=v.size()-1;i>=0;i--)
    {
        ans += v[i]*base;
        base *= 10;
    }
    v.clear();
    return ans;
}

int main()
{
    ll cube,permutation;
    pair<int,int> pii;
    int cnt=0;
    for(ll i=100;i<=1000000;i++)
    {
        cube = i*i*i;
        //DEBUG(i);
        //DEBUG(cube);
        permutation = biggest_permutation(cube);
        pii = mymap[permutation];
        //DEBUG(biggest_permutation(cube));
        //cout<<pii.first<<" "<<pii.second<<endl;
        if(pii.second == 0) pii.second = i;
        else pii.second = pii.second > i ? i : pii.second;
        pii.first++;
        mymap[permutation] = pii;
        //cout<<pii.first<<" "<<pii.second<<endl;
        if(pii.first == 5)
        {
            cout<<pii.second<<endl;
            break;
        }
        //cout<<mymap[987655433210].first<<endl;

    }
	return 0;
}
