using System;
using System.Collections.Generic;
using System.Linq;

class Program
{
    static int SumOfDigits(int n)
    {
        return n.ToString().Sum(c => c - '0');
    }

    static int ProductOfDigits(int n)
    {
        int result = 1;
        foreach (char digit in n.ToString())
        {
            result *= digit - '0';
        }
        return result;
    }

    static List<int> FindNumbers(List<int> sequence)
    {
        List<int> result = new List<int>();
        for (int i = 0; i < sequence.Count; i++)
        {
            int number = sequence[i];
            if (number >= 0 && SumOfDigits(number) < ProductOfDigits(number))
            {
                result.Add(i + 1);
            }
        }
        return result;
    }

    static void Main()
    {
        List<int> sequence = new List<int> { 3, 27, 14, 99 };
        List<int> output = FindNumbers(sequence);
        Console.WriteLine(string.Join(", ", output));
    }
}