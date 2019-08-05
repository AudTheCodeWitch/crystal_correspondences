# This is my CLI controller
class CrystalCorrespondences::CLI
  def call
    puts "Welcome, friend!"
    menu
  end

  def menu
    puts "To see a list of crystals, type 'list'."
    puts "To see crystals by their purpose, type 'purpose'."
    puts "To see crystals by their color, type 'color.'"
    puts "To exit, type 'exit'."
    input = nil
    while input != 'exit'
      input = gets.strip
      case input
      when list
        list
      when purpose
        purpose
      when color
        color
      else
        puts "Try one of these options:"
        menu
      end
    end
  end

  # - show welcome message
  # - show menu
  # - user types crystals
  # - show list of crystals
  # - user chooses crystal
  # - show crystal correspondences
  # - show menu
  # - user types exit
  # - show goodbye message
end
