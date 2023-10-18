# frozen_string_literal: true
def valid_ipv4?(ip)
  parts = ip.split(".")

  return false unless parts.length == 4

  parts.each do |part|
    return false unless  part.match?(/^\d+$/)

    num = part.to_i
    return false unless num >= 0 && num <= 255

    return false unless num.to_s == part || (num == 0 && part == '0')
  end

true
end

puts "Enter IPv4 adr: "
ip_address = gets.chomp

puts "#{ip_address}", "Do this IPv4 address correct?"

if valid_ipv4?(ip_address)
  puts "Yes, this IPv4 address is correct"
else
  puts "No, this IPv4 address is uncorrected"
end

