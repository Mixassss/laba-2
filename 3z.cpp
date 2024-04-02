#include <iostream>
#include <vector>
#include <string>
using namespace std;

int sum_of_digits(int n) {
    int sum = 0;
    string str_n = to_string(n);
    for (char digit : str_n) {
        sum += digit - '0';
    }
    return sum;
}

int product_of_digits(int n) {
    int result = 1;
    string str_n = to_string(n);
    for (char digit : str_n) {
        result *= digit - '0';
    }
    return result;
}

vector<int> find_numbers(std::vector<int> sequence) {
    vector<int> result;
    for (int i = 0; i < sequence.size(); i++) {
        if (sequence[i] >= 0 && sum_of_digits(sequence[i]) < product_of_digits(sequence[i])) {
            result.push_back(i + 1);
        }
    }
    return result;
}

int main() {
    vector<int> chisla = {3, 27, 14, 99};
    vector<int> output = find_numbers(chisla);
    for (int num : output) {
        cout << num << " ";
    }
    cout << endl;
    return 0;
}