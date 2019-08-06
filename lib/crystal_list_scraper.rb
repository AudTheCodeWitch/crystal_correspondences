require 'open-uri'
require 'nokogiri'
require 'pry'

class CrystalListScraper
  doc = Nokogiri::HTML(open('https://beadage.net/gemstones/'))
  card = doc.css('.card.flex-card.horizontal.per-row-1-2')
  # card.each do |card|
  #   name = card.css('h3').text
  #   crystal_url = card.css('h3').css('a').attribute('href').value
  #   binding.pry
  #
  card.each do |card|
    crystal_url = card.css('h3').css('a').attribute('href').value
    crystal_doc = Nokogiri::HTML(open(crystal_url))
    # name:  crystal_doc.css('.row').css('.col-xs-12.col-sm-8').css('h1').text.gs
    # ub(' Meaning', '')
    # crystal_url: see above
    # color:
    # purpose:
    # healing_properties:
    # gemstone_properties:

    binding.pry
  end

end


# name: doc.css('.card.flex-card.horizontal.per-row-1-2').first.css('h3').text
# color:
# purpose:
# healing_properties: crystal_doc.css('.entry-content').css('p')[0].text
# gemstone_properties: crystal_doc.css('.entry-content').css('p')[-3..-2].text
# crystal_url: doc.css('.card.flex-card.horizontal.per-row-1-2').first.css('h3').css('a').att
# ribute('href').value