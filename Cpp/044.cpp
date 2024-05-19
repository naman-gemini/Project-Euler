#include<cstdio>
#include<iostream>
#include<string>
#include<sstream>
#include<algorithm>
#include<vector>
using namespace std;

vector<int> v;
vector<int>::iterator it;

int main()
{
	for(int i=1;i<=10000;i++)
	{
		v.push_back(i*(3*i-1)/2);
	}

	int ret=10000000;

	for(int i=0;i<v.size()-1;i++)
	{
		for(int j=i+1;j<v.size();j++)
		{
			if(binary_search(v.begin(),v.end(),v[i]+v[j]) && binary_search(v.begin(),v.end(),v[j]-v[i]))
			{
				int ans=v[j]-v[i];
				ret=min(ans,ret);
			}
		}
	}
	cout<<ret;
}