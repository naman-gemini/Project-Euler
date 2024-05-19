#include <cstdio>
#include <iostream>
#include <algorithm>
#include <string>
#include <vector>
#include <map>
#include <fstream>
#define DEBUG(x) printf(#x"=%d\n",x)
#define pcc pair<char,char>
#define pii pair<int,int>
using namespace std;

vector<pcc> player1;
vector<pcc> player2;

map<char,int> suits;
map<char,int> values;
map<string, int> ranks;

void init_suits()
{
    suits['S']=0;
    suits['H']=1;
    suits['C']=2;
    suits['D']=3;
}

void init_values()
{
    for(int i=2;i<=9;i++) values[char(48+i)] = i;
    values['T']=10;
    values['J']=11;
    values['Q']=12;
    values['K']=13;
    values['A']=14;
}

void init_ranks()
{
    ranks["rf"] = 9;
    ranks["sf"] = 8;
    ranks["4k"] = 7;
    ranks["fh"] = 6;
    ranks["flush"] = 5;
    ranks["st"] = 4;
    ranks["3k"] = 3;
    ranks["2p"] = 2;
    ranks["1p"] = 1;
    ranks["hc"] = 0;
}

bool compare(pcc a, pcc b)
{
    return values[a.first] < values[b.first];
}

bool royal_flush(vector<pcc> &v)
{
    //same suit
    bool flag = false;
    int count[4] = {0};
    for(int i=0;i<5;i++) count[suits[v[i].second]]++;
    for(int i=0;i<4;i++) if(count[i]==5) flag = true;

    if(v[0].first != 'T') return false;
    if(v[1].first != 'J') return false;
    if(v[2].first != 'Q') return false;
    if(v[3].first != 'K') return false;
    if(v[4].first != 'A') return false;
    return flag & true;
}

bool straight_flush(vector<pcc> &v)
{
    //same suit
    bool flag = false;
    int count[4] = {0};
    for(int i=0;i<5;i++) count[suits[v[i].second]]++;
    for(int i=0;i<4;i++) if(count[i]==5) flag = true;
    if(!flag) return false;

    if(values[v[4].first] - values[v[3].first] != values[v[3].first] - values[v[2].first]) return false;
    if(values[v[3].first] - values[v[2].first] != values[v[2].first] - values[v[1].first]) return false;
    if(values[v[2].first] - values[v[1].first] != values[v[1].first] - values[v[0].first]) return false;
    if(values[v[3].first] - values[v[2].first] != 1) return false;
    return true;
}

bool four_kind(vector<pcc> &v)
{
    int count[15] = {0};

    for(int i=0;i<5;i++)
    {
        count[values[v[i].first]]++;
    }

    for(int i=2;i<15;i++)
    {
        if(count[i] == 4) return true;
    }
    return false;
}

bool full_house(vector<pcc> &v)
{
    int count[15];
    for(int i=0;i<15;i++) count[i] = 0;

    for(int i=0;i<5;i++)
    {
        count[values[v[i].first]]++;
    }

    for(int i=2;i<15;i++)
    {
        if(count[i] == 3)
        {
            for(int j=2;j<15;j++)
            {
                if(j==i) continue;
                if(count[j] == 2) return true;
            }
        }
    }
    return false;
}

bool flush(vector<pcc> &v)
{
    //same suit
    bool flag = false;
    int count[4] = {0};
    for(int i=0;i<5;i++) count[suits[v[i].second]]++;
    for(int i=0;i<4;i++) if(count[i]==5) return true;
    return false;
}

bool straight(vector<pcc> &v)
{
    if(values[v[4].first] - values[v[3].first] != values[v[3].first] - values[v[2].first]) return false;
    if(values[v[3].first] - values[v[2].first] != values[v[2].first] - values[v[1].first]) return false;
    if(values[v[2].first] - values[v[1].first] != values[v[1].first] - values[v[0].first]) return false;
    if(values[v[3].first] - values[v[2].first] != 1) return false;
    return true;
}

bool three_kind(vector<pcc> &v)
{
   int count[15] = {0};

    for(int i=0;i<5;i++)
    {
        count[values[v[i].first]]++;
    }

    for(int i=2;i<15;i++)
    {
        if(count[i] == 3) return true;
    }
    return false;
}

bool two_pairs(vector<pcc> &v)
{
    int count[15] = {0};

    for(int i=0;i<5;i++)
    {
        count[values[v[i].first]]++;
    }

    for(int i=2;i<15;i++)
    {
        if(count[i]==2)
        {
            for(int j=2;j<15;j++)
            {
                if(j==i) continue;
                if(count[j]==2) return true;
            }
        }
    }
    return false;
}

bool one_pair(vector<pcc> &v)
{
    int count[15] = {0};

    for(int i=0;i<5;i++)
    {
        count[values[v[i].first]]++;
    }

    for(int i=2;i<15;i++)
    {
        if(count[i]==2) return true;
    }
    return false;
}

int solve_sf()
{
    for(int i=4;i>=0;i--)
    {
        if(values[player1[i].first] > values[player2[i].first]) return 1;
        else if(values[player1[i].first] < values[player2[i].first]) return 2;
        else continue;
    }
}

int solve_4k()
{
    int count1[15] = {0};
    for(int i=0;i<5;i++)
    {
        count1[values[player1[i].first]]++;
    }
    int count2[15] = {0};
    for(int i=0;i<5;i++)
    {
        count2[values[player2[i].first]]++;
    }

    int repeat1,repeat2;
    int diff1,diff2;

    for(int i=2;i<15;i++)
    {
        if(count1[i] == 4) repeat1 = i;
        if(count2[i] == 4) repeat2 = i;
        if(count1[i] == 1) diff1 = i;
        if(count2[i] == 1) diff2 = i;
    }

    if(repeat1 > repeat2) return 1;
    else if(repeat2 > repeat1) return 2;
    else
    {
        if(diff1 > diff2) return 1;
        else return 2;
    }
    return 2;
}

int solve_fh()
{
    int count1[15] = {0};
    for(int i=0;i<5;i++)
    {
        count1[values[player1[i].first]]++;
    }
    int count2[15] = {0};
    for(int i=0;i<5;i++)
    {
        count2[values[player2[i].first]]++;
    }

    int three1, three2;
    int two1, two2;

    for(int i=2;i<15;i++)
    {
        if(count1[i] == 3) three1 = i;
        if(count2[i] == 3) three2 = i;
        if(count1[i] == 2) two1 = i;
        if(count2[i] == 2) two2 = i;
    }

    if(three1 > three2) return 1;
    else if(three2 > three1) return 2;
    else
    {
        if(two1 > two2) return 1;
        else return 2;
    }
}

int solve_flush()
{
    for(int i=4;i>=0;i--)
    {
        if(values[player1[i].first] > values[player2[i].first]) return 1;
        else if(values[player2[i].first] > values[player1[i].first]) return 2;
        else continue;
    }
}

int solve_st()
{
    for(int i=4;i>=0;i--)
    {
        if(values[player1[i].first] > values[player2[i].first]) return 1;
        else return 2;
    }
}

int solve_3k()
{
    int count1[15] = {0};
    for(int i=0;i<5;i++)
    {
        count1[values[player1[i].first]]++;
    }
    int count2[15] = {0};
    for(int i=0;i<5;i++)
    {
        count2[values[player2[i].first]]++;
    }

    int three1,three2;
    //-1 means its unassigned right now
    int other_small1=-1, other_small2=-1;
    int other_big1, other_big2;

    for(int i=2;i<15;i++)
    {
        if(count1[i] == 3) three1 = i;
        if(count2[i] == 3) three2 = i;
        if(count1[i] == 1 && other_small1 == -1) other_small1 = i;
        if(count2[i] == 1 && other_small2 == -1) other_small2 = i;
        if(count1[i] == 1 && other_small1 != -1) other_big1 = i;
        if(count2[i] == 1 && other_small2 != -1) other_big2 = i;
    }

    if(three1 > three2) return 1;
    else if(three2 > three1) return 2;
    else
    {
        if(other_big1 > other_big2) return 1;
        else if(other_big2 > other_big1) return 2;
        else
        {
            if(other_small1 > other_small2) return 1;
            else return 2;
        }
    }

}

int solve_2p()
{
    int count1[15] = {0};
    for(int i=0;i<5;i++)
    {
        count1[values[player1[i].first]]++;
    }
    int count2[15] = {0};
    for(int i=0;i<5;i++)
    {
        count2[values[player2[i].first]]++;
    }

    int two_small_1 = -1, two_small_2 = -1;
    int two_big_1, two_big_2;
    int other_1, other_2;

    for(int i=2;i<15;i++)
    {
        if(count1[i] == 2 && two_small_1 == -1) two_small_1 = i;
        if(count2[i] == 2 && two_small_2 == -1) two_small_2 = i;
        if(count1[i] == 2 && two_small_1 != -1) two_big_1 = i;
        if(count2[i] == 2 && two_small_2 != -1) two_big_2 = i;
        if(count1[i] == 1) other_1 = i;
        if(count2[i] == 1) other_2 = i;
    }

    if(two_big_1 > two_big_2) return 1;
    else if(two_big_2 > two_big_1) return 2;
    else
    {
        if(two_small_1 > two_small_2) return 1;
        else if(two_small_2 > two_small_1) return 2;
        else
        {
            if(other_1 > other_2) return 1;
            else return 2;
        }
    }
}

int solve_1p()
{
    int count1[15] = {0};
    for(int i=0;i<5;i++)
    {
        count1[values[player1[i].first]]++;
    }
    int count2[15] = {0};
    for(int i=0;i<5;i++)
    {
        count2[values[player2[i].first]]++;
    }

    int repeat1,repeat2;
    vector<int> others1,others2;
    for(int i=2;i<15;i++)
    {
        if(count1[i] == 2) repeat1 = i;
        if(count2[i] == 2) repeat2 = i;
        if(count1[i] == 1) others1.push_back(i);
        if(count2[i] == 1) others2.push_back(i);
    }

    if(repeat1 > repeat2) return 1;
    else if(repeat2 > repeat1) return 2;
    else
    {
        for(int i=2;i>=0;i--)
        {
            if(others1[i] > others2[i]) return 1;
            else if (others2[i] > others1[i]) return 2;
            else continue;
        }
    }
}

int solve_hc()
{
    for(int i=4;i>=0;i--)
    {
        if(values[player1[i].first] > values[player2[i].first]) return 1;
        else if(values[player2[i].first] > values[player1[i].first]) return 2;
        else continue;
    }
}

int tie_breaker(string a)
{
    if (a == "sf") return solve_sf();
    if (a == "4k") return solve_4k();
    if (a == "fh") return solve_fh();
    if (a == "flush") return solve_flush();
    if (a == "st") return solve_st();
    if (a == "3k") return solve_3k();
    if (a == "2p") return solve_2p();
    if (a == "1p") return solve_1p();
    if (a == "hc") return solve_hc();
}

string get_winning_condition(vector<pcc> &v)
{
    sort(v.begin(),v.end(),compare);
    if(royal_flush(v)) return "rf";
    else if(straight_flush(v)) return "sf";
    else if(four_kind(v)) return "4k";
    else if(full_house(v)) return "fh";
    else if(flush(v)) return "flush";
    else if(straight(v)) return "st";
    else if(three_kind(v)) return "3k";
    else if(two_pairs(v)) return "2p";
    else if(one_pair(v)) return "1p";
    else return "hc";
}

int solve()
{
    vector<pcc> v1,v2;
    for(int i=0;i<5;i++) v1.push_back(player1[i]), v2.push_back(player2[i]);
    string p1=get_winning_condition(v1);
    string p2=get_winning_condition(v2);
    //cout<<p1<<" "<<p2<<endl;
    if(ranks[p1] > ranks[p2]) return 1;
    else if(ranks[p2] > ranks[p1]) return 2;
    else return tie_breaker(p1);
}

void print_array()
{
    for(int i=0; i<5; i++)
    {
        cout<<player1[i].first<<player1[i].second<<" ";
    }
    for(int i=0; i<5; i++)
    {
        cout<<player2[i].first<<player2[i].second<<" ";
    }
    cout<<endl;
}

int main()
{
    init_suits();
    init_values();
    init_ranks();
    int ans,count = 0;
    char a,b;
    freopen("poker_result.txt","a",stdout);
    ifstream file("poker.txt");
    while(file.good())
    {
        for(int i=0; i<5; i++)
        {
            file>>a>>b;
            player1.push_back(make_pair(a,b));
        }
        for(int i=0; i<5; i++)
        {
            file>>a>>b;
            player2.push_back(make_pair(a,b));
        }

        //print_array();
        sort(player1.begin(),player1.end(),compare);
        sort(player2.begin(),player2.end(),compare);
        print_array();
        ans = solve();
        if(ans == 1)
        {
            count++;
            printf("Player1\n");
        }
        else
        {
            printf("Player2\n");
        }
        player1.clear();
        player2.clear();
    }
    printf("%d\n",count);
    return 0;
}
