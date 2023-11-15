require 'nokogiri'
require 'csv'
require 'open-uri'

# URL сайту
url = 'https://www.hospitalsafetygrade.org/all-hospitals'

# Отримання HTML сторінки
html = URI.open(url)

# Створення об'єкта Nokogiri
doc = Nokogiri::HTML(html)

# Вибір елементів за CSS селектором
hospitals = doc.css('.content .columnWrapper .column1 #BlinkDBContent_849210 ul li a')

CSV.open('hospitals.csv', 'w') do |csv|
  csv << ['Hospital Name']

  # Запис назв лікарень
  hospitals.each do |hospital|
    csv << [hospital.text.strip]
  end
end

puts 'Дані занесено у hospitals.csv'
