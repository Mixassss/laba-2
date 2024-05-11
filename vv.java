public class vv {
    public static int sumDigits(int n) {
        int s = 0;
        while (n != 0) {
            s += n % 10;
            n /= 10;
        }
        return s;
    }

    public static int productDigits(int n) {
        int p = 1;
        while (n != 0) {
            p *= n % 10;
            n /= 10;
        }
        return p;
    }

    public static boolean checkNum(int n) {
        return sumDigits(n) < productDigits(n);
    }

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        String[] numbersStr = scanner.nextLine().split(" ");
        List<Integer> numbers = new ArrayList<>();
        for (String numStr : numbersStr) {
            numbers.add(Integer.parseInt(numStr));
        }

        List<String> result = new ArrayList<>();
        int index = 1;
        for (int number : numbers) {
            if (checkNum(number)) {
                result.add(String.valueOf(index));
            }
            index++;
        }

        System.out.println(String.join(" ", result));
    }
}
