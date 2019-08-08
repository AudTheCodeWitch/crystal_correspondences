class Color
  attr_accessor :name
  attr_reader :crystals
  @@all = []

  def initialize(name)
    @name = name
    @crystals = []
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

  def add_crystal(crystal)
    CrystalColors.new(crystal, self)
  end

  def crystals
    CrystalColors.all.select do |crystal|
      crystal.color == self
    end.map{ |cc| cc.crystal}
  end

end