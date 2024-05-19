#include<cmath>
#include<iostream>
#include<cstdio>
#include<fstream>
#include<vector>
#define MAX 1000
using namespace std;

vector<int> a;
vector<int> b;

int main()
{
    int base,exp,ans;
    char comma;
    a.push_back(-1);
    b.push_back(-1);
    double current,max;
    ifstream file("base_exp.txt");
    while(file.good())
    {
        file>>base>>comma>>exp;
        a.push_back(base);
        b.push_back(exp);
    }

    for(int i=1;i<=1000;i++)
    {
        current = b[i]*log10(a[i]);
        if(current > max)
        {
            max = current;
            ans = i;
        }
    }

    file.close();
    cout<<ans;
}
