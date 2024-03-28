import re

stroka = "11001101000110"
regular = "1[0]+1"
res = re.finditer(regular, stroka)

for match in res:
    print(match.group(0))