fn main() {
    let str = "sd10sds101sdd100101"; // строка
    let mut in_state = 0;
    let mut out = String::new();

    for (i, c) in str.chars().enumerate() {
        if c == '1' && in_state == 0 {
            in_state = 1;
            out.push('1');
            continue;
        }
        if c == '1' && in_state == 2 {
            out.push('1');
            println!("{}", out);
            in_state = 0;
        }
        if c == '0' && (in_state == 1 || in_state == 2) {
            out.push('0');
            in_state = 2;
        } else if in_state == 1 || in_state == 2 {
            in_state = 0;
        }
    }
}
