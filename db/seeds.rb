# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "open-uri"
require "nokogiri"

p "Destroying all races..."
Race.destroy_all
p "All races are deleted"

p "Creating races..."

html = URI.open("https://jogging-plus.com/calendrier/courses-5-10-15-km/france/").read
doc = Nokogiri::HTML(html, nil, "utf-8")
doc.search("tr").first(10).each do |element|
  name = element.search(".lienorange").text.strip
  date = element.search("td:first-child").text.strip
  address = element.search("td:last-child").text.strip
  race = Race.new(name: name, address: address, latitude: Geocoder.coordinates(address)[0], longitude: Geocoder.coordinates(address)[1], date: date)
  race.save
end

p "#{Race.count} races are created"


#   file = URI.open(element.attributes["src"])
# doc.search(".lienorange").drop(1).each do |element|
# .next_element.text
# doc.search("tr").first(10).each do |element|
# doc.search("tr").drop(1).each do |element|
