# frozen_string_literal: true
def factorial(n)
  if n == 0 || n == 1
    return 1;
  else
    return n * factorial(n - 1)
  end
end
puts "Enter the number for calculate factorial"
num = gets.chomp.to_i

if num < 0
  puts "The factorial of a negative number does not exist."
else
  res = factorial(num)
  puts "The factorial #{num} = #{res}"
end
