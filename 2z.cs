using System;
using System.Collections.Generic;

class Program
{
    static int RomToInt(string s)
    {
        Dictionary<char, int> romNums = new Dictionary<char, int>
        {
            {'I', 1}, {'V', 5}, {'X', 10}, {'L', 50}, {'C', 100}, {'D', 500}, {'M', 1000}
        };

        int res = romNums[s[^1]]; // Численное значение для последнего символа

        for (int i = s.Length - 2; i >= 0; i--)
        {
            if (romNums[s[i]] < romNums[s[i + 1]])
            {
                res -= romNums[s[i]]; // Если меньшая цифра перед большей, вычитаем ее значение
            }
            else
            {
                res += romNums[s[i]]; // Складываем значения
            }
        }

        return res;
    }

    static void Main()
    {
        Console.Write("Enter a Roman numeral: ");
        string num = Console.ReadLine();
        Console.WriteLine("Number: " + RomToInt(num));
    }
}