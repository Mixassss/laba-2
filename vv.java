import java.util.ArrayList;
import java.util.List;

public class vv {
    
    public static void main(String[] args) {
        int[] sequence = {3, 27, 14, 99};
        int[] output = findNumbers(sequence);
        for (int num : output) {
            System.out.print(num + " ");
        }
    }

    public static int sumOfDigits(int n) {
        int sum = 0;
        String numStr = String.valueOf(n);
        for (int i = 0; i < numStr.length(); i++) {
            sum += Character.getNumericValue(numStr.charAt(i));
        }
        return sum;
    }

    public static int productOfDigits(int n) {
        int result = 1;
        String numStr = String.valueOf(n);
        for (int i = 0; i < numStr.length(); i++) {
            result *= Character.getNumericValue(numStr.charAt(i));
        }
        return result;
    }

    public static int[] findNumbers(int[] sequence) {
        List<Integer> result = new ArrayList<>();
        for (int i = 0; i < sequence.length; i++) {
            if (sequence[i] >= 0 && sumOfDigits(sequence[i]) < productOfDigits(sequence[i])) {
                result.add(i + 1);
            }
        }
        return result.stream().mapToInt(Integer::intValue).toArray();
    }
}