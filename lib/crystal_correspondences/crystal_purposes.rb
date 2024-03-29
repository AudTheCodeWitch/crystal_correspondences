class CrystalPurposes
  attr_accessor :crystal, :purpose
  @@all = []

  def initialize(crystal, purpose)
    @crystal = crystal
    @purpose = purpose
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create(crystal, purpose)
    purpose = new(crystal, purpose)
    purpose.save
    purpose
  end
end