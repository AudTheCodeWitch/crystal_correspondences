# This is my CLI controller
class CrystalCorrespondences::CLI
  # show welcome message
  def call
    puts "Welcome, friend!"
    menu
  end

  # show menu
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
        purposes
      when color
        colors
      else
        puts "Try one of these options:"
        menu
      end
    end
  end

  # user types list
  # show list of crystals
  def list
    #get list of crystals
    puts 'To learn more about a crystal, type the number.'
    puts "To go back, type 'menu'."
    puts "To exit, type 'exit'."
    input = gets.strip
    case input
    when menu
      menu
    when #an integer
      # puts info about that crystal
    when exit
      "Goodbye!"
    else
      list
    end
    list
  end

  def purposes
    #get list of purposes
    puts 'To see crystals for a specific purpose, type the number.'
    puts "To go back, type 'menu'."
    puts "To exit, type 'exit'."
    input = gets.strip
    case input
    when menu
      menu
    when #an integer
      # puts list of crystals
      # maybe call list?
    when exit
      "Goodbye!"
    else
      purpose
    end
    purpose
  end

  def colors
    #get list of colors
    puts 'To see crystals of a certain color, type the number.'
    puts "To go back, type 'menu'."
    puts "To exit, type 'exit'."
    input = gets.strip
    case input
    when menu
      menu
    when #an integer
      # puts list of crystals
      # maybe call list?
    when exit
      "Goodbye!"
    else
      purpose
    end
    purpose
  end

end
