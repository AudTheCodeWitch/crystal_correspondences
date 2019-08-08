class CrystalPurposes
  # Use this to assign purposes to crystals and crystals to purposes - joining model

  attr_accessor :crystal, :purpose
  @@all = []

  def initialize(crystal, purpose)
    @crystal = crystal
    @purpose = purpose
    @@all << self
  end

  def self.all
    @@all
  end

end