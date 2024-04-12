let str = "sd10sds101sdd100101"; // строка
let inVar = 0;
let out = "";

for (let i = 0; i < str.length; i++) {
    if (str[i] === '1' && inVar === 0) {
        inVar = 1;
        out = '1';
        continue;
    }
    if (str[i] === '1' && inVar === 2) {
        out += '1';
        console.log(out);
        inVar = 0;
        i--;
    }
    if (str[i] === '0' && (inVar === 1 || inVar === 2)) {
        out += '0';
        inVar = 2;
    } else if (inVar === 1 || inVar === 2) {
        inVar = 0;
    }
}
