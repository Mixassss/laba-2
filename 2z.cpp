#include <iostream>
#include <map>
using namespace std;

int romToInt(string s) {
    map<char, int> romNums = { {'I', 1}, {'V', 5}, {'X', 10}, {'L', 50}, {'C', 100}, {'D', 500}, {'M', 1000} };
    
    int res = romNums[s.back()];  // Численное значение для последнего символа
    for (int i = s.length() - 2; i >= 0; i--) {
        if (romNums[s[i]] < romNums[s[i + 1]]) {
            res -= romNums[s[i]];  // Если меньшая цифра перед большей, вычитаем ее значение
        } else {
            res += romNums[s[i]];  // Складываем значения
        }
    }
    
    return res;
}

int main() {
    string num;
    cout << "Введите римское число: ";
    cin >> num;
    cout << "Число: " << romToInt(num) << endl;
    
    
    return 0;
}