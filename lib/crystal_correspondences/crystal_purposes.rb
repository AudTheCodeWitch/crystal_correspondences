class CrystalPurposes
  # Use this to assign purposes to crystals and crystals to purposes - joining model
  # I need to create a new purpose instance and add the crystal to it. If one already exists, just add the crystal.
  # I need to push the new purpose to the crystal's purposes array.
  #
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