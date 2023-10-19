# frozen_string_literal: true
def is_prime?(number)
  if number <= 1
    return false
  end
  for i in 2..Math.sqrt(number)
    if number % i == 0
      return false
    end
  end
  return true
end

puts "Enter the number: "
num = gets.chomp.to_i

if is_prime?(num)
  puts "#{num} it is prime number"
else
  puts "#{num} it is not prime number"
end
