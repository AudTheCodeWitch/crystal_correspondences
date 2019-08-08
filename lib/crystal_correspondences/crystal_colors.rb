require 'pry'
class CrystalColors
  # Use this to assign colors to crystals and crystals to colors
  # I need to create a new color instance and add the crystal to it. If one already exists, just add the crystal.
  attr_accessor :crystal, :color
  @@all = []

  def initialize(crystal, color)
    @crystal = crystal
    @color = color
    @@all << self
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