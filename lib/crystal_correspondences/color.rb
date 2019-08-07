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

end