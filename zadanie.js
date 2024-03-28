const stroka = "11001101000110";
const regular = new RegExp("1[0]+1", "g");
const matches = stroka.match(regular);

matches.forEach(match => {
  console.log(match);
});