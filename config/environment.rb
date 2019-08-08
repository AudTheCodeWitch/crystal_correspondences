require 'nokogiri'
require 'open-uri'
require 'pry'
require 'require_all'
require_all './lib/crystal_correspondences'

test = Scraper.new
test.get_crystals
binding.pry