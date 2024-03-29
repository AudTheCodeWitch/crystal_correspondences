require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
  def open_index
    Nokogiri::HTML(open('https://beadage.net/gemstones/'))
  end

  def scrape_list
    open_index.css('.card.flex-card.horizontal.per-row-1-2')
  end

  def scrape_crystals
    crystal_hash = {}
    scrape_list.each do |card|
      crystal_hash['name'] = card.css('h3').text
      crystal_hash['crystal_url'] = card.css('h3').css('a').attribute('href').value
      Crystal.create_from_hash(crystal_hash)
    end
  end

  def scrape_properties
    Crystal.all.each do |crystal|
      crystal_doc = Nokogiri::HTML(open(crystal.crystal_url))
      properties_text = crystal_doc.css('.entry-content').css('div')[-2].text

      associate_color(properties_text, crystal)


      if properties_text.include?('Type of:')
        purpose_array = properties_text.split('Color:')[0].split('Uses:')[1].strip.split('Type of:')[0].split(', ')
      else
        purpose_array = properties_text.split('Color:')[0].split('Uses:')[1].strip.split(', ')
      end

      purpose_array.map{|purpose| Purpose.find_or_create(purpose)}.each { |purpose| CrystalPurposes.create(crystal, purpose) }
    end
  end

  private

  def associate_color(properties_text, crystal)
    if properties_text.include?('Color:')
      color_array = properties_text.split('Color:')[1].strip.split(', ')
    else
      color_array = ['Multicolored Gemstones']
    end
    color_array.map{|color| Color.find_or_create(color)}.each { |color| CrystalColors.create(crystal, color) }
  end


    # name: doc.css('.crystal.flex-crystal.horizontal.per-row-1-2').first.css('h3').text
    # color: crystal_doc.css('.entry-content').css('div')[-2].text.split('Color:')[1].strip
    # purpose: crystal_doc.css('.entry-content').css('div')[-2].text.split('Color:')[0].split('Uses:')[1].strip
    # crystal_url: doc.css('.crystal.flex-crystal.horizontal.per-row-1-2').css('h3').css('a').attribute('href').value
end


