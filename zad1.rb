require 'pry'

str = "sd10sds101sdd100101"
in_var = 0
out = ""

(0..str.length-1).each do |i|
  if str[i] == '1' && in_var == 0
    in_var = 1
    out = '1'
    next
  end
  if str[i] == '1' && in_var == 2
    out += '1'
    puts out
    in_var = 0
    i -= 1
  end
  if str[i] == '0' && (in_var == 1 || in_var == 2)
    out += '0'
    in_var = 2
  elsif in_var == 1 || in_var == 2
    in_var = 0
  end
end
