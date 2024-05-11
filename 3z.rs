fn sum_digits(mut n: i32) -> i32 {
    let mut s = 0;
    while n != 0 {
        s += n % 10;
        n /= 10;
    }
    s
}

fn product_digits(mut n: i32) -> i32 {
    let mut p = 1;
    while n != 0 {
        p *= n % 10;
        n /= 10;
    }
    p
}

fn check_num(n: i32) -> bool {
    sum_digits(n) < product_digits(n)
}

fn main() {
    let mut input = String::new();
    std::io::stdin().read_line(&mut input).unwrap();
    let numbers: Vec<i32> = input
        .split_whitespace()
        .map(|x| x.parse().unwrap())
        .collect();

    let mut result = Vec::new();
    let mut index = 1;

    for &number in &numbers {
        if check_num(number) {
            result.push(index.to_string());
        }
        index += 1;
    }

    println!("{}", result.join(" "));
}
