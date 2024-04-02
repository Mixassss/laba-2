function sumOfDigits(n) {
    let sum = 0;
    let numStr = n.toString();
    for (let i = 0; i < numStr.length; i++) {
      sum += parseInt(numStr.charAt(i));
    }
    return sum;
  }
  
  function productOfDigits(n) {
    let result = 1;
    let numStr = n.toString();
    for (let i = 0; i < numStr.length; i++) {
      result *= parseInt(numStr.charAt(i));
    }
    return result;
  }
  
  function findNumbers(sequence) {
    let result = [];
    for (let i = 0; i < sequence.length; i++) {
      if (sequence[i] >= 0 && sumOfDigits(sequence[i]) < productOfDigits(sequence[i])) {
        result.push(i + 1);
      }
    }
    return result;
  }
  
  let sequence = [3, 27, 14, 99];
  let output = findNumbers(sequence);
  output.forEach(num => {
    console.log(num + " ");
  });