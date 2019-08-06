require 'pry'
class Crystals
# Hold all the crystals and properties
# Properties: name, color, purpose (set as an array), healing properties, gemstone properties
attr_accessor :name, :crystal_url, :color, :purpose, :healing_properties, :gemstone_properties
  @@all = []
  def initialize(name, color, purpose, healing_properties, gemstone_properties)
    @name = name
    @color = color
    @purpose = purpose # or maybe use purpose.split by comma
    @healing_properties = healing_properties
    @gemstone_properties = gemstone_properties
    @@all << self
  end



  def self.all
    @@all
  end
  binding.pry
end

