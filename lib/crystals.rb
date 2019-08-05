class Crystals
# Hold all the crystals and properties
# Properties: name, color, purpose (set as an array), healing properties, gemstone properties
attr_accessor :name, :color, :healing_properties, :gemstone_properties
attr_reader :purpose
  @@all = []
  def initialize(name, color = nil, purpose = nil, healing_properties = nil, gemstone_properties = nil)
    @name = name
    @color = color
    @purpose << purpose # or maybe use purpose.split by comma
    @healing_properties = healing_properties
    @gemstone_properties = gemstone_properties
    @@all << self
  end

def purpose=
  []
end

  def self.all
    @@all
  end
end