require 'pry'
class Crystals
# Hold all the crystals and properties
# Properties: name, color, purpose, url
attr_accessor :name, :crystal_url, :color, :purpose
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
  binding.pry
end

