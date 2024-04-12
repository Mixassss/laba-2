#include <iostream>
#include <string>

using namespace std;

int main() {
    
    string str = "sd10sds101sdd100101"; // строка
    int in = 0;
    string out ="";
    for (int i = 0; i < str.length(); i++){
        if(str[i]=='1' && in == 0){
            in = 1;
            out = '1';
            continue; 
        }
        if(str[i]=='1' && in == 2){
            out += '1';
            cout << out << endl;
            in = 0;
            i--;
        }
        if (str[i]=='0' && (in == 1 || in == 2)){
            out += '0';
            in = 2;
        }
        else if(in == 1 || in == 2){
            in = 0;
        }
        
    }

    return 0;
}
