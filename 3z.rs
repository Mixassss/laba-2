fn sum_of_digits(n: i32) -> i32 {
    n.to_string().chars().map(|c| c.to_digit(10).unwrap() as i32).sum()
}

fn product_of_digits(n: i32) -> i32 {
    let mut result = 1;
    for digit in n.to_string().chars() {
        result *= digit.to_digit(10).unwrap() as i32;
    }
    result
}

fn find_numbers(sequence: Vec<i32>) -> Vec<usize> {
    let mut result = Vec::new();
    for (index, &number) in sequence.iter().enumerate() {
        if number >= 0 && sum_of_digits(number) < product_of_digits(number) {
            result.push(index + 1);
        }
    }
    result
}

fn main() {
    let sequence = vec![3, 27, 14, 99];
    let output = find_numbers(sequence);
    println!("{:?}", output);
}