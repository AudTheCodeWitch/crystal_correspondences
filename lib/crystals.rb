require 'pry'
class Crystals
# Hold all the crystals and properties
# Properties: name, color, purpose, url
attr_accessor :name, :crystal_url, :colors, :purposes
  @@all = []
  def initialize(name)
    @name = name
    @crystal_url = crystal_url
    @colors = []
    @purposes = []
    @@all << self
  end

def add_color(color)
  @colors << color
end

def add_purpose(purpose)
  @purposes << purpose
end

  def self.all
    @@all
  end
  binding.pry
end

