using System;
using System.Text.RegularExpressions;

class Program
{
    static void Main()
    {
        string stroka = "11001101000110";
        Regex regular = new Regex("1[0]+1");
        MatchCollection matches = regular.Matches(stroka);
        
        foreach (Match match in matches)
        {
            Console.WriteLine(match.Value);
        }
    }
}