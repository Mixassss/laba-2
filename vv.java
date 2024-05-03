public class vv {
    public static void main(String[] args) {
        int[] числа = {3, 27, 14, 99};
        int номер = 1;
        for (int число : числа) {
            if (проверка_числа(число)) {
                System.out.print(номер + " ");
            }
            номер++;
        }
    }

    public static int сумма_цифр(int n) {
        int сумма = 0;
        while (n > 0) {
            сумма += n % 10;
            n /= 10;
        }
        return сумма;
    }

    public static int произведение_цифр(int n) {
        int произведение = 1;
        while (n > 0) {
            произведение *= n % 10;
            n /= 10;
        }
        return произведение;
    }

    public static boolean проверка_числа(int n) {
        return сумма_цифр(n) < произведение_цифр(n);
    }
}
