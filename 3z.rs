fn sum_of_digits(mut n: i32) -> i32 {
    let mut sum = 0;
    while n > 0 {
        sum += n % 10;
        n /= 10;
    }
    sum
}

fn product_of_digits(mut n: i32) -> i32 {
    let mut product = 1;
    while n > 0 {
        product *= n % 10;
        n /= 10;
    }
    product
}

fn check_number(n: i32) -> bool {
    sum_of_digits(n) < product_of_digits(n)
}

fn main() {
    let numbers = vec![3, 27, 14, 99];
    let mut number = 1;
    for num in numbers {
        if check_number(num) {
            print!("{} ", number);
        }
        number += 1;
    }
}
