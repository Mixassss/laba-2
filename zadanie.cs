using System;

class Program
{
    static void Main()
    {
        string str = "sd10sds101sdd100101"; // строка
        int inState = 0;
        string output = "";

        for (int i = 0; i < str.Length; i++)
        {
            if (str[i] == '1' && inState == 0)
            {
                inState = 1;
                output = "1";
                continue;
            }
            if (str[i] == '1' && inState == 2)
            {
                output += "1";
                Console.WriteLine(output);
                inState = 0;
                i--;
            }
            if (str[i] == '0' && (inState == 1 || inState == 2))
            {
                output += "0";
                inState = 2;
            }
            else if (inState == 1 || inState == 2)
            {
                inState = 0;
            }
        }
    }
}
