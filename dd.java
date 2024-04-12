public class dd {
    public static void main(String[] args) {
        String str = "sd10sds101sdd100101"; // строка
        int in = 0;
        String out = "";
        for (int i = 0; i < str.length(); i++) {
            if (str.charAt(i) == '1' && in == 0) {
                in = 1;
                out = "1";
                continue;
            }
            if (str.charAt(i) == '1' && in == 2) {
                out += "1";
                System.out.println(out);
                in = 0;
                i--;
            }
            if (str.charAt(i) == '0' && (in == 1 || in == 2)) {
                out += "0";
                in = 2;
            } else if (in == 1 || in == 2) {
                in = 0;
            }
        }
    }
}
