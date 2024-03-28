use regex::Regex;

fn main() {
    let stroka = "11001101000110";
    let regular = Regex::new(r"1[0]+1").unwrap();
    let matches = regular.find_iter(stroka);

    for mat in matches {
        println!("{}", mat.as_str());
    }
}
