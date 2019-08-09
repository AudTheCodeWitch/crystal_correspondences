class Color
  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    color = new(name)
    color.save
    color
  end

  def self.find_or_create(name)
    @@all.find do |c|
      c.name == name
    end || create(name)
  end

  def self.crystals(c)
    CrystalColors.all.select do |crystal|
      crystal.color == c
    end.map{ |cc| cc.crystal }
  end

end