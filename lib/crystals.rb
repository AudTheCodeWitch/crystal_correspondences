class Crystals
# Hold all the crystals and properties
# Properties: name, color (added via color class), purpose (added via purpose class), healing properties, gemstone properties
attr_accessor :name, :color, :purpose, :healing_properties, :gemstone_properties
  @@all = []
  def initialize(name, color = nil, purpose = nil, healing_properties = nil, gemstone_properties = nil)
    @name = name
    @color = color
    @purpose = purpose
    @healing_properties = healing_properties
    @gemstone_properties = gemstone_properties
    @@all << self
  end

  def self.all
    @@all
  end
end