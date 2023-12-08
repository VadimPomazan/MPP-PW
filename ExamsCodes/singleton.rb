# frozen_string_literal: true

class Singleton
  @@instance = nil

  #Створення приватного конструктора, що забороняє створаннє об'єктів
  private_class_method def initialize
    # Певна ініціалізація об'єкта
  end

  #Метод для отримання єдиного кземпляру класу
  def self.instance
    #Якщо екземплюру ще не був створеним, то створюємо його
    # Якщо створений то повертаємо, за здалегідь створений екземпляр
    @@instance ||= new
  end

  #Певна бізнес логіка Одинака
  def bl_method_hello
    puts "Hello! I am Singleton!"
  end
end

#Код клієнтської сторони

#Використання та створення Одинака
singleton_instance_1 = Singleton.instance
singleton_instance_1.bl_method_hello

#Перевірка, чи єдиний екземпляр є єдиною точкою
singleton_instance_2 = Singleton.instance
if singleton_instance_2.eql?(singleton_instance_1)
  #Якщо правда то одинак працює правильно
  puts "Both variable contain the same instance"
else
  #Якщо брехня то одинак прцює не коректно і створює нові об'єкти класу
  puts "Variables contain different instance"
end
