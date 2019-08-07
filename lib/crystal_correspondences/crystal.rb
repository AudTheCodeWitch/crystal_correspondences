require 'pry'
class Crystal
  # Hold all the crystals and properties
  # Properties: name, color, purpose, url
  attr_accessor :name, :crystal_url
  attr_reader :colors, :purposes

  @@all = []
  def initialize(name, crystal_url)
    @name = name
    @crystal_url = crystal_url
    # @colors = []
    # @purposes = []
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name, crystal_url)
    crystal = new(name, crystal_url)
    crystal.save
    crystal
  end

  def add_purpose(purpose)
    CrystalPurposes.new(self, purpose)
  end

  def purposes
    CrystalPurposes.all.select do |purpose|
      purpose.crystal == self
    end
  end

  def add_color(color)
    CrystalColors.new(self, color)
  end

  def colors
    CrystalColors.all.select do |color|
      color.crystal == self
    end
  end

end

