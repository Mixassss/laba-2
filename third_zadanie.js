function sumDigits(n) {
    let s = 0;
    while (n) {
        s += n % 10;
        n = Math.floor(n / 10);
    }
    return s;
}

function productDigits(n) {
    let p = 1;
    while (n) {
        p *= n % 10;
        n = Math.floor(n / 10);
    }
    return p;
}

function checkNum(n) {
    return sumDigits(n) < productDigits(n);
}

const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

rl.question('Enter numbers separated by space: ', (input) => {
    const numbers = input.split(' ').map(Number);
    const result = [];
    let index = 1;

    numbers.forEach((number) => {
        if (checkNum(number)) {
            result.push(String(index));
        }
        index++;
    });

    console.log(result.join(' '));
    rl.close();
});
