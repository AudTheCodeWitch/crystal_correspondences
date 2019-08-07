require 'open-uri'
require 'nokogiri'
require 'pry'

class CrystalScraper
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
    # name: doc.css('.card.flex-card.horizontal.per-row-1-2').first.css('h3').text
    # color: crystal_doc.css('.entry-content').css('div')[-2].text.split('Color:')[1].strip
    # purpose: crystal_doc.css('.entry-content').css('div')[-2].text.split('Color:')[0].split('Uses:')[1].strip
    # crystal_url: doc.css('.card.flex-card.horizontal.per-row-1-2').first.css('h3').css('a').attribute('href').value

    binding.pry
  end

end


