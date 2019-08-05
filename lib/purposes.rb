class Purposes
# Hold all the crystals and properties
# Properties: name, color (added via color class), purpose (added via purpose class), healing properties, gemstone properties
@@all = []
  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end