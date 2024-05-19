#include<cstdio>
#include<iostream>
using namespace std;

int main()
{
    //1st jan 1901 is tuesday
    int ans=0;
    //month from jan
    //day from mon
    int month=1,day=2,date=1,year=1901;
    for(date=1;;date++,day++)
    {
        //cout<<"date:"<<date<<" month:"<<month<<" year:"<<year<<endl;
        if(month==4 || month==6 || month==9 || month==11)
        {
            if(date>=31)
            {
                date=1;
                month++;
            }
        }
        else if(month==2)
        {
            if(year%4==0)
            {
                if(date>=30)
                {
                    date=1;
                    month++;
                }
            }
            else
            {
                if(date>=29)
                {
                    date=1;
                    month++;
                }
            }
        }
        else
        {
            if(date>=32)
            {
                date=1;
                month++;
                if(month>=13)
                {
                    month=1;
                    year++;
                }
            }
        }
        if(date==31 && month==12 && year==2000) break;
        if(day>=8) day=1;
        if(date==1 && day==7) ans++;
    }
    cout<<ans;
}
