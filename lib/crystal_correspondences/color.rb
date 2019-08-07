class Color
  attr_accessor :name
  attr_reader :crystals
  @@all = []

  def initialize(name)
    @name = name
    @crystals = []
    @@all << self
  end

  def self.all
    @@all
  end

end