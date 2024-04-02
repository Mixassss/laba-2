use std::collections::HashMap;
use std::io;

fn rom_to_int(s: &str) -> i32 {
    let mut rom_nums = HashMap::new();
    rom_nums.insert('I', 1);
    rom_nums.insert('V', 5);
    rom_nums.insert('X', 10);
    rom_nums.insert('L', 50);
    rom_nums.insert('C', 100);
    rom_nums.insert('D', 500);
    rom_nums.insert('M', 1000);

    let mut res = *rom_nums.get(&s.chars().last().unwrap()).unwrap_or(&0);
    for i in (0..s.len() - 1).rev() {
        if rom_nums[&s.chars().nth(i).unwrap()] < rom_nums[&s.chars().nth(i + 1).unwrap()] {
            res -= rom_nums[&s.chars().nth(i).unwrap()];
        } else {
            res += rom_nums[&s.chars().nth(i).unwrap()];
        }
    }

    res
}

fn main() {
    let mut num = String::new();
    println!("Введите римское число: ");
    io::stdin().read_line(&mut num).expect("Failed to read line");
    let num = num.trim();

    println!("Число: {}", rom_to_int(num));
}