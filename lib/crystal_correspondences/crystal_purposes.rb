class CrystalPurposes
  # Use this to assign purposes to crystals and crystals to purposes
  # I need to create a new purpose instance and add the crystal to it. If one already exists, just add the crystal.
  def new_purpose(name)
    Purpose.new(name) # unless it's already there
  end
  # I need to push the new purpose to the crystal's purposes array.
end