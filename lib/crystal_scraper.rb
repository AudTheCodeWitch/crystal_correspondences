require 'open-uri'
require 'nokogiri'
require 'pry'

class CrystalScraper
  doc = Nokogiri::HTML(open('https://beadage.net/gemstones/'))
  binding.pry
end


# name:
# color:
# purpose:
# healing_properties:
# gemstone_properties:
# crystal_url: