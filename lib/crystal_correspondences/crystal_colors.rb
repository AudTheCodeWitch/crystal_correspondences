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

  def self.all
    @@all
  end

end