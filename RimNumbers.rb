ROMAN_NUMERALS = {
  'I' => 1,
  'V' => 5,
  'X' => 10,
  'L' => 50,
  'C' => 100,
  'D' => 500,
  'M' => 1000
}

def roman_to_int(s)
  total = 0
  prev_value = 0

  s.reverse.each_char do |char|
    value = ROMAN_NUMERALS[char]
    if value < prev_value
      total -= value
    else
      total += value
    end
    prev_value = value
  end

  total
end

def int_to_roman(num)
  roman_numerals = [
    ["M", 1000],
    ["CM", 900],
    ["D", 500],
    ["CD", 400],
    ["C", 100],
    ["XC", 90],
    ["L", 50],
    ["XL", 40],
    ["X", 10],
    ["IX", 9],
    ["V", 5],
    ["IV", 4],
    ["I", 1]
  ]

  roman_numeral = ""
  roman_numerals.each do |symbol, value|
    while num >= value
      roman_numeral += symbol
      num -= value
    end
  end

  roman_numeral
end


print "Введіть римську цифру: "
roman_input = gets.chomp.upcase


integer_value = roman_to_int(roman_input)
puts "Ціле число: #{integer_value}"


print "Введіть ціле число (1-3999): "
integer_input = gets.chomp.to_i

if integer_input >= 1 && integer_input < 4000
  roman_value = int_to_roman(integer_input)
  puts "Римська цифра: #{roman_value}"
else
  puts "Неправильний ввід. Введіть число в діапазоні від 1 до 3999."
end

