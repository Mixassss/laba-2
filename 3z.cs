using System;

class Program
{
    static int SumOfDigits(int n)
    {
        int sum = 0;
        while (n > 0)
        {
            sum += n % 10;
            n /= 10;
        }
        return sum;
    }
    static int ProductOfDigits(int n)
    {
        int product = 1;
        while (n > 0)
        {
            product *= n % 10;
            n /= 10;
        }
        return product;
    }
    static bool CheckNumber(int n)
    {
        return SumOfDigits(n) < ProductOfDigits(n);
    }

    static void Main()
    {
        int[] numbers = { 3, 27, 14, 99 };
        int index = 1;
        foreach (int number in numbers)
        {
            if (CheckNumber(number))
            {
                Console.Write(index + " ");
            }
            index++;
        }
    }
}
