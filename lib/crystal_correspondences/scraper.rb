require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  def open_index
    Nokogiri::HTML(open('https://beadage.net/gemstones/'))
  end

  def get_list
    open_index.css('.card.flex-card.horizontal.per-row-1-2')
  end

  def get_crystals
    get_list.each do |card|
      name = card.css('h3').text
      crystal_url = card.css('h3').css('a').attribute('href').value
      Crystal.create(name, crystal_url)
    end
  end

  def scrape_properties
    Crystal.all.each do |crystal|
      crystal_doc = Nokogiri::HTML(open(crystal.crystal_url))
      properties_text = crystal_doc.css('.entry-content').css('div')[-2].text
      if properties_text.include?('Color:')
        crystal.color_array = properties_text.split('Color:')[1].strip.split(', ')
      else
        crystal.color_array = ['Too many color options!']
      end
      if properties_text.include?('Type of:')
        crystal.purpose_array = properties_text.split('Color:')[0].split('Uses:')[1].strip.split('Type of:')[0].split(', ')
      else
        crystal.purpose_array = properties_text.split('Color:')[0].split('Uses:')[1].strip.split(', ')
      end
    end
  end

    # name: doc.css('.crystal.flex-crystal.horizontal.per-row-1-2').first.css('h3').text
    # color: crystal_doc.css('.entry-content').css('div')[-2].text.split('Color:')[1].strip
    # purpose: crystal_doc.css('.entry-content').css('div')[-2].text.split('Color:')[0].split('Uses:')[1].strip
    # crystal_url: doc.css('.crystal.flex-crystal.horizontal.per-row-1-2').css('h3').css('a').attribute('href').value
end


