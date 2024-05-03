function sumOfDigits(n) {
  let sum = 0;
  while (n > 0) {
      sum += n % 10;
      n = Math.floor(n / 10);
  }
  return sum;
}

function productOfDigits(n) {
  let product = 1;
  while (n > 0) {
      product *= n % 10;
      n = Math.floor(n / 10);
  }
  return product;
}

function checkNumber(n) {
  return sumOfDigits(n) < productOfDigits(n);
}

const numbers = [3, 27, 14, 99];
let index = 1;
for (let number of numbers) {
  if (checkNumber(number)) {
      process.stdout.write(index + ' ');
  }
  index++;
}
