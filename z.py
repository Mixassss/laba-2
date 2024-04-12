str = "sd10sds101sdd100101"  # строка
in_ = 0
out = ""
i = 0
while i < len(str):
    if str[i] == '1' and in_ == 0:
        in_ = 1
        out = '1'
    elif str[i] == '1' and in_ == 2:
        out += '1'
        print(out)
        in_ = 0
        i -= 1
    elif str[i] == '0' and (in_ == 1 or in_ == 2):
        out += '0'
        in_ = 2
    elif in_ == 1 or in_ == 2:
        in_ = 0
    i += 1
