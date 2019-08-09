class CrystalColors
  attr_accessor :crystal, :color
  @@all = []

  def initialize(crystal, color)
    @crystal = crystal
    @color = color
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create(crystal, color)
    color = new(crystal, color)
    color.save
    color
  end
end