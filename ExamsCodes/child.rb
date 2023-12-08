# frozen_string_literal: true

class Child
  attr_accessor :name

  def initialize(name)
    @name = name
  end
  def say_hello
    puts "Hello, World!"
  end
end

#Створюємо об'єкт класу
child = Child.new("Vadim")
#Перевіряємо роботу методу greet
puts "Method \"say_hello\". Before creating metaclass of Child:"
child.say_hello

puts "Method \"say_hello\". After creating metaclass of Child:"

#Перевизначаємо метод greet в метакласі об'єкта
class << child

  def say_hello
    puts "Hello, I am #{@name}"
  end
end

#Перевіряємо роботу перевизначного методу
child.say_hello
