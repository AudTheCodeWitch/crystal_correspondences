require 'pry'
class CrystalColors
  # Use this to assign colors to crystals and crystals to colors
  # I need to create a new color instance and add the crystal to it. If one already exists, just add the crystal.
  def new_color(name)
    Color.new(name) # unless it's already there
  end
  # I need to push the new color to the crystal's purposes array.
end