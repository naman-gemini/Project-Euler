#include<cstdio>
#include<iostream>
#include<algorithm>
#include<string>
#include<vector>
#include<sstream>
#define DEBUG(x) printf(#x"=%d\n",x)
using namespace std;
typedef long long ll;

int arr[10]= {1,2,3,4,5,6,7,8,9,10};
int chain[5]= {0};
vector<ll> v;

string number_to_string(int n)
{
    stringstream s;
    s << n;
    return s.str();
}

ll string_to_number(string s)
{
    ll value = 0;
    ll base = 1;
    for(int i=s.size()-1; i>=0; i--)
    {
        value += (s[i]-'0')*base;
        base*=10;
    }
    return value;
}

ll concatenate_numbers()
{
    string s="";
    for(int i=0; i<5; i++) s+=number_to_string(chain[i]);
    //cout<<"value of s is = "<<s<<endl;
    //cout<<"value of n is = "<<string_to_number(s)<<endl;
    if(s.size()==17) return 0;
    else return string_to_number(s);
}

ll value()
{
    return concatenate_numbers();
}

int generate_chain(int a,int b,int c)
{
    if(b==10)
    {
        return a*1000+b*10+c;
    }
    if(c==10)
    {
        return a*1000+b*100+c;
    }
    return a*100+b*10+c;
}

int sum_range[4] = {14,16,17,19};
int main()
{
    int sum;
    for(int i=0; i<4; i++)
    {
        sum=sum_range[i];
        do
        {
            if(arr[0]+arr[1]+arr[4] == sum && arr[2]+arr[4]+arr[7] == sum &&
                    arr[8]+arr[7]+arr[6] == sum && arr[9]+arr[6]+arr[3] == sum &&
                    arr[5]+arr[3]+arr[1] == sum)
            {
                chain[0] = generate_chain(arr[0],arr[1],arr[4]);
                chain[1] = generate_chain(arr[2],arr[4],arr[7]);
                chain[2] = generate_chain(arr[8],arr[7],arr[6]);
                chain[3] = generate_chain(arr[9],arr[6],arr[3]);
                chain[4] = generate_chain(arr[5],arr[3],arr[1]);
                v.push_back(value());
            }
        }
        while(next_permutation(arr,arr+10));
    }
    cout<<v.size()<<endl;
    ll ans=0;
    for(int i=0; i<v.size(); i++)
    {
        if(v[i]>0) cout<<v[i]<<endl;
        if(v[i]>ans) ans=v[i];
    }
    cout<<ans;
    return 0;
}
