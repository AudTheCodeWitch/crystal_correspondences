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

  # def add_crystal(crystal)
  #   CrystalColors.new(crystal, self)
  # end
  #
  # def crystals
  #   CrystalColors.all.select do |crystal|
  #     crystal.color == self
  #   end.map{ |cc| cc.crystal}
  # end

end