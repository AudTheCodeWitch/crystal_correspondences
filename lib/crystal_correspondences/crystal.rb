require 'pry'
class Crystal
  # Holds all the crystals and properties
  attr_accessor :name, :crystal_url
  attr_reader :colors, :purposes

  @@all = []

  def initialize(name, crystal_url)
    @name = name
    @crystal_url = crystal_url
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  # {name => ruby,
  # crystal_url => link}

  def self.create_from_hash(hash)
    name = hash['name']
    crystal_url = hash['crystal_url']
    create(name, crystal_url)
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
    end.map{ |cp| cp.purpose.name}
  end

  def add_color(color)
    CrystalColors.new(self, color)
  end

  def colors
    CrystalColors.all.select do |color|
      color.crystal == self
    end.map{ |cc| cc.color.name}
  end
end

