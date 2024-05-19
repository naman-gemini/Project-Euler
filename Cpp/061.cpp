#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

#define NUM 6

struct item
{
    short val, type;
};

item make_item(int a, int b)
{
    item new_item = {a, b};
    return new_item;
}

vector<item> list;

void init_polygonals()
{
    short tmp;
    for(int n = 10; n < 142; ++n) //10000 = n*(n+1)/2 => n = 142
    {
        tmp = n*(n+1)/2;
        if(tmp > 999 && tmp < 10000) list.push_back( make_item(tmp,0));
        tmp = n*n;
        if(tmp > 999 && tmp < 10000) list.push_back( make_item(tmp,1));
        tmp = n*(3*n-1)/2;
        if(tmp > 999 && tmp < 10000) list.push_back( make_item(tmp,2));
        tmp = n*(2*n-1);
        if(tmp > 999 && tmp < 10000) list.push_back( make_item(tmp,3));
        tmp = n*(5*n-3)/2;
        if(tmp > 999 && tmp < 10000) list.push_back( make_item(tmp,4));
        tmp = n*(3*n-2);
        if(tmp > 999 && tmp < 10000) list.push_back( make_item(tmp,5));
    }
}

void calculate(short vals[NUM], bool done[NUM], int depth = 1)
{
    if(depth == NUM)
        return;
    for(int i = 0; i < list.size(); ++i)
        if(vals[depth-1]%100 == list[i].val/100 && !done[list[i].type])
        {
            vals[depth] = list[i].val;
            done[list[i].type] = true;
            calculate(vals, done, depth+1);
            if(depth+1 == NUM && vals[0]/100 == vals[NUM-1]%100)
            {
                int sum = 0;
                for(int j = 0; j < NUM; ++j)
                {
                    cout << vals[j] << ' ';
                    sum += vals[j];
                }
                cout << endl << "Sum of the series is: " << sum << endl;
            }
        }
}

int main()
{
    init_polygonals();
    for(int i = 0; i < list.size(); ++i)
    {
        //stores the solution chain
        short vals[NUM] = {0};
        //to check we're done with which series
        bool done[NUM] = {false};
        vals[0] = list[i].val;
        done[list[i].type] = true;
        calculate(vals, done);
    }
    return 0;
}
