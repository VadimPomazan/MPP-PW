# frozen_string_literal: true

#Abstract Smith(Factory)
#
class AbstractSmith
  def create_sword
    raise NotImplementedError, "Потрібно реалізувати метод '#{__method__}'"
  end

  #@abstract
  def create_spear
    raise NotImplementedError, "Потрібно реалізувати метод '#{__method__}'"
  end
end

#Concret Smiths (Factories)
#
class JapanesesSmith < AbstractSmith
  def create_sword
    Katana.new
  end

  def create_spear
    Yari.new
  end

end

class NorwegianSmith < AbstractSmith
  def create_sword
    Spata.new
  end

  def create_spear
    VikingSpear.new
  end

end

#Abstract Products
#
class Sword
  def to_s
    raise NotImplementedError, "Потрібно реалізувати метод '#{__method__}'"
  end
end

class Spear
  def to_s
    raise NotImplementedError, "Потрібно реалізувати метод '#{__method__}'"
  end
end

#Concrect Products
class VikingSpear < Spear
  def to_s
    "Спис Вікінга"
  end
end

class Yari < Spear
  def to_s
    "Ярі"
  end
end

class Katana < Sword
  def to_s
    "Катана"
  end
end
class Spata < Sword
  def to_s
    "Спата"
  end
end

#Testing
#
def test_factory(factory)
  sword = factory.create_sword
  spear = factory.create_spear

  puts "Кузнець: #{factory.class}"
  puts "Меч: #{sword}"
  puts "Спис: #{spear}"
  puts "\n"
end

# Створення фабрик і перевірка продуктів
japanese_factory = JapanesesSmith.new
norwegian_factory = NorwegianSmith.new

test_factory(japanese_factory)
test_factory(norwegian_factory)
