#include<cstdio>
#include<iostream>
#include<vector>
#include<fstream>
#include<sstream>
using namespace std;

vector<int> L;
vector<int> S;

int visited[10][10];
int adj[10][10];
//adj[i][j]=1 means edge from i->j

void init()
{
	for(int i=0;i<10;i++)
	{
		for(int j=0;j<10;j++)
		{
			adj[i][j]=0;
		}
	}
}

int value(string s)
{
	int x=1;
	int sum=0;
	for(int i=s.size()-1;i>=0;i--)
	{
		sum+=(s[i]-'0')*x;
		x*=10;
	}
	return sum;
}

void make(string s)
{
	//number is left to right a->b->c
	//a depends on b a->b
	//edge x to y if x depends on y x->y=edge
	int val=value(s);
	int a,b,c;
	a=val%10;
	b=(val/10)%10;
	c=(val/100);
	adj[a][b]=1;
	adj[b][c]=1;
}

vector<int> topsort()
{
	
}

int main()
{
	init();
    int a;
    string s;
    ifstream file ("keylog.txt");
    if(file.is_open())
    {
        while(file.good())
        {
            getline(file,s);
            cout<<s<<endl;
            make(s);
        }
    }

    vector<int> v=topsort();
    file.close();
}
