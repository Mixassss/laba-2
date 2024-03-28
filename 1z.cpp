#include <iostream>
#include <string>
#include <regex>
using namespace std;

int main() {
    string stroka = "11001101000110";
    regex regular("1[0]+1"); // условие поиска
    smatch res; // результат

    while (regex_search(stroka, res, regular)) {
        cout << res[0] << endl;
        stroka = res.suffix().str(); // Suffix после найденной комбинации удаляет её и возвращает поиск по строке
    }

    return 0;
}