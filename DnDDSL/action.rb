class Action
  def self.roll_dice(sides = 20)
    rand(1..sides)
  end

  def self.show_characters_on_location(location)
    puts "Персонажі на локації #{location.name}:"
    location.characters.each { |character| puts "#{character.name} (Здоров'я: #{character.health}, Рівень: #{character.level})" }
  end

  def self.show_monsters_on_location(location)
    puts "Монстри на локації #{location.name}:"
    location.monsters.each { |monster| puts "#{monster.name} (Здоров'я: #{monster.health}, Рівень: #{monster.level})" }
  end

  def self.move_character_to_location(character, location)
    puts "#{character.name} рухається до локації #{location.name}"
    location.characters << character
    character.location = location

    # Перевірка, чи в локації є монстр
    if location.monsters.any?
      monster = location.monsters.sample
      puts "#{character.name} зустрів монстра #{monster.name}!"

      # Бой з монстром, можливо, використовуючи характеристики персонажа та монстра
      # fight(character, monster)
    end
  end

  def self.fight(character, monster)
    puts "#{character.name} вступив у бій з #{monster.name}!"

    # Ваш код для боротьби
    # Наприклад, генерація різної кількості пошкоджень на основі характеристик
    while character.is_alive? and monster.is_alive?
      character_damage = calculate_damage(character, monster)
      monster_damage = calculate_damage(monster, character)

      puts "#{character.name} наніс #{monster.name} #{character_damage} пошкоджень!"
      puts "#{monster.name} наніс #{character.name} #{monster_damage} пошкоджень!"

    # Оновлення здоров'я персонажа та монстра на основі пошкоджень
      character.health -= monster_damage
      monster.health -= character_damage
    end
    # Перевірка, чи живі персонаж і монстр
    unless character.is_alive?
      remove_character_from_location(character, character.location)
      puts "#{character.name} вмер у бою."
    end

    unless monster.is_alive?
      character.location.monsters.delete(monster)
      puts "#{monster.name} вбитий."
    end
  end

  def self.calculate_damage(attacker, defender)
    attacker_modifier = calculate_modifier(attacker)
    defender_modifier = calculate_modifier(defender)

    attacker_roll = roll_dice + attacker_modifier
    defender_roll = roll_dice + defender_modifier

    # Ваш код для обчислення пошкоджень
    # Наприклад, простий розрахунок на основі різниці результатів кидка кубика
    damage = (attacker_roll - defender_roll).clamp(1, 10)
    return damage
  end

  def self.calculate_modifier(character)
    # Розрахунок модифікатора на основі характеристик
    abilities = character.abilities
    return ((abilities[:strength] + abilities[:constitution] + abilities[:dexterity] + abilities[:intelligence] + abilities[:wisdom] + abilities[:charisma]) / 2.0 - 10) / 2.0
  end


  def self.remove_character_from_location(character, location)
    puts "#{character.name} покидає локацію #{location.name}"
    location.characters.delete(character)
    character.location = nil
  end
  def self.is_alive?(entity)
    entity.health > 0
  end
end

class Character
  attr_accessor :name, :location, :abilities, :health, :level

  def initialize(name, abilities = {})
    @name = name
    @location = nil
    @abilities = {
      strength: abilities[:strength] || 10,
      constitution: abilities[:constitution] || 10,
      dexterity: abilities[:dexterity] || 10,
      intelligence: abilities[:intelligence] || 10,
      wisdom: abilities[:wisdom] || 10,
      charisma: abilities[:charisma] || 10
    }
    @health = 100  # Припустиме значення для здоров'я за замовчуванням
    @level = 1     # Припустимий рівень за замовчуванням
  end
  def is_alive?
    Action.is_alive?(self)
  end
end

class Location
  attr_accessor :name, :characters, :monsters

  def initialize(name)
    @name = name
    @characters = []
    @monsters = []
  end
end

class Monster
  attr_accessor :name, :abilities, :health, :level

  def initialize(name, abilities = {})
    @name = name
    @abilities = {
      strength: abilities[:strength] || 10,
      constitution: abilities[:constitution] || 10,
      dexterity: abilities[:dexterity] || 10,
      intelligence: abilities[:intelligence] || 10,
      wisdom: abilities[:wisdom] || 10,
      charisma: abilities[:charisma] || 10
    }
    @health = 50  # Припустиме значення для здоров'я за замовчуванням
    @level = 1    # Припустимий рівень за замовчуванням
  end
  def is_alive?
    Action.is_alive?(self)
  end
end

# Приклад використання
character = Character.new("Герой", strength: 15, constitution: 12, dexterity: 14, intelligence: 10, wisdom: 8, charisma: 16)
location = Location.new("Ліс")

monster = Monster.new("Гоблін", strength: 12, constitution: 10, dexterity: 14, intelligence: 8, wisdom: 10, charisma: 6)

location.monsters << monster

Action.move_character_to_location(character, location)

puts "#{character.name} знаходиться в локації #{character.location.name}"
puts "Характеристики персонажа: #{character.abilities}"
puts "Рівень: #{character.level}, Здоров'я: #{character.health}"


Action.show_monsters_on_location(location)
Action.show_characters_on_location(location)

