import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

public class cc {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.print("Введите римское число: ");
        String num = scanner.nextLine();
        System.out.println("Число: " + romToInt(num));
    }

    public static int romToInt(String s) {
        Map<Character, Integer> romNums = new HashMap<>();
        romNums.put('I', 1);
        romNums.put('V', 5);
        romNums.put('X', 10);
        romNums.put('L', 50);
        romNums.put('C', 100);
        romNums.put('D', 500);
        romNums.put('M', 1000);

        int res = romNums.get(s.charAt(s.length() - 1)); // Numeric value for the last character
        for (int i = s.length() - 2; i >= 0; i--) {
            if (romNums.get(s.charAt(i)) < romNums.get(s.charAt(i + 1))) {
                res -= romNums.get(s.charAt(i)); // If a smaller digit is before a larger one, subtract its value
            } else {
                res += romNums.get(s.charAt(i)); // Add values
            }
        }

        return res;
    }
}