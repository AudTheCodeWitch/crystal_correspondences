class Purpose
  attr_accessor :name
  attr_reader :crystals
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
  def self.find_or_create(name)
    @@all.find do |p|
      p.name == name
    end || create(name)
  end
  def self.create(name)
    purpose = new(name)
    purpose.save
    purpose
  end

  # def add_crystal(crystal)
  #   CrystalPurposes.new(crystal, self)
  # end
  #

  def self.crystals(p)
    CrystalPurposes.all.select do |crystal|
      crystal.purpose == p
    end.map{ |cp| cp.crystal}
  end

end