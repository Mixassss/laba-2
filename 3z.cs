using System;
using System.Collections.Generic;

class Program
{
    static int SumDigits(int n)
    {
        int s = 0;
        while (n != 0)
        {
            s += n % 10;
            n /= 10;
        }
        return s;
    }

    static int ProductDigits(int n)
    {
        int p = 1;
        while (n != 0)
        {
            p *= n % 10;
            n /= 10;
        }
        return p;
    }

    static bool CheckNum(int n)
    {
        return SumDigits(n) < ProductDigits(n);
    }

    static void Main()
    {
        string[] numbersStr = Console.ReadLine().Split();
        List<int> numbers = new List<int>();
        foreach (string numStr in numbersStr)
        {
            numbers.Add(int.Parse(numStr));
        }

        List<string> result = new List<string>();
        int index = 1;
        foreach (int number in numbers)
        {
            if (CheckNum(number))
            {
                result.Add(index.ToString());
            }
            index++;
        }

        Console.WriteLine(string.Join(" ", result));
    }
}
