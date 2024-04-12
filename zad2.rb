def roman_to_int(s)
    roman_nums = { 'I' => 1, 'V' => 5, 'X' => 10, 'L' => 50, 'C' => 100, 'D' => 500, 'M' => 1000 }
    result = roman_nums[s[-1]] # Get numerical value for the last character
  
    (s.length - 2).downto(0) do |i|
      if roman_nums[s[i]] < roman_nums[s[i + 1]]
        result -= roman_nums[s[i]] # If smaller digit before larger one, subtract its value
      else
        result += roman_nums[s[i]] # Otherwise, add values
      end
    end
  
    result
  end
  
  input = "XII"
  puts "Число: #{roman_to_int(input)}"
