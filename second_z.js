const romToInt = (s) => {
    const romNums = {
      'I': 1,
      'V': 5,
      'X': 10,
      'L': 50,
      'C': 100,
      'D': 500,
      'M': 1000
    };
  
    let res = romNums[s[s.length - 1]];
  
    for (let i = s.length - 2; i >= 0; i--) {
      if (romNums[s[i]] < romNums[s[i + 1]]) {
        res -= romNums[s[i]];
      } else {
        res += romNums[s[i]];
      }
    }
  
    return res;
  };
  
  const readline = require('readline');
  const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
  });
  
  rl.question('Введите римское число: ', (num) => {
    console.log('Число: ' + romToInt(num));
    rl.close();
  });