def sum_digits(n)
  s = 0
  while n != 0
    s += n % 10
    n /= 10
  end
  s
end

def product_digits(n)
  p = 1
  while n != 0
    p *= n % 10
    n /= 10
  end
  p
end

def check_num(n)
  sum_digits(n) < product_digits(n)
end

if __FILE__ == $PROGRAM_NAME
  numbers = gets.chomp.split.map(&:to_i)
  result = []
  index = 1
  numbers.each do |number|
    result << index.to_s if check_num(number)
    index += 1
  end
  puts result.join(" ")
end
