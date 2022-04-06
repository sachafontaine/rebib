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
  address = element.search("td:last-child").text.strip
  url = element.search(".lienorange").attribute("href").value

  html2 = URI.open(url).read
  doc2 = Nokogiri::HTML(html2, nil, "utf-8")
  date = doc2.search("#bloc-date-fiche").text.strip

  race = Race.new(name: name, address: address, latitude: Geocoder.coordinates(address)[0], longitude: Geocoder.coordinates(address)[1], date: date)
  race.save
end

p "#{Race.count} races are created"

# doc.search("tr").first(10).each do |element|
# doc.search("tr").drop(1).each do |element|
