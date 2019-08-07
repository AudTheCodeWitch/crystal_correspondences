require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  def get_page
    Nokogiri::HTML(open('https://beadage.net/gemstones/'))
  end

  def scrape_crystal_list
    self.get_page.css('.crystal.flex-crystal.horizontal.per-row-1-2')
  end
  # doc = Nokogiri::HTML(open('https://beadage.net/gemstones/'))
  # crystal = doc.css('.crystal.flex-crystal.horizontal.per-row-1-2')
  # crystal.each do |crystal|
  #   name = crystal.css('h3').text
  #   crystal_url = crystal.css('h3').css('a').attribute('href').value
  #   binding.pry
  #
  def make_crystals
    scrape_crystal_list.each do |crystal|
      name = get_page.css('.crystal.flex-crystal.horizontal.per-row-1-2').first.css('h3').text
      crystal_url = get_page.css('.crystal.flex-crystal.horizontal.per-row-1-2').first.css('h3').css('a').attribute('href').value
      Crystals.new(name, crystal_url)
    end
  end
  # crystal.each do |crystal|
  #   crystal_url = crystal.css('h3').css('a').attribute('href').value
   # crystal_doc = Nokogiri::HTML(open(crystal_url))
    # name: doc.css('.crystal.flex-crystal.horizontal.per-row-1-2').first.css('h3').text
    # color: crystal_doc.css('.entry-content').css('div')[-2].text.split('Color:')[1].strip
    # purpose: crystal_doc.css('.entry-content').css('div')[-2].text.split('Color:')[0].split('Uses:')[1].strip
    # crystal_url: doc.css('.crystal.flex-crystal.horizontal.per-row-1-2').first.css('h3').css('a').attribute('href').value



binding.pry
end


