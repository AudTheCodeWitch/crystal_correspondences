require 'open-uri'
require 'nokogiri'
require 'pry'

class CrystalListScraper
  doc = Nokogiri::HTML(open('https://beadage.net/gemstones/'))
  card = doc.css('.card.flex-card.horizontal.per-row-1-2')
  card.each do |card|
    name = card.css('h3').text
    crystal_url = card.css('h3').css('a').attribute('href').value
  end
  binding.pry
end


# name: doc.css('.card.flex-card.horizontal.per-row-1-2').first.css('h3').text
# color:
# purpose:
# healing_properties:
# gemstone_properties:
# crystal_url: doc.css('.card.flex-card.horizontal.per-row-1-2').first.css('h3').css('a').att
# ribute('href').value