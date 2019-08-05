# This is my CLI controller
class CrystalCorrespondences::CLI
  # show welcome message
  def call
    puts "Welcome, friend!"
    menu
    goodbye
  end

  # show menu
  def menu
    puts "To see a list of crystals, type 'list'."
    puts "To see crystals by their purpose, type 'purpose'."
    puts "To see crystals by their color, type 'color.'"
    puts "To exit, type 'exit'."
    input = gets.strip.downcase
      while input != 'exit'
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

  def list
    #get list of crystals
    puts 'To learn more about a crystal, type the number.'
    puts "To go back, type 'menu'."
    input = gets.strip.downcase
    case input
    when menu
      menu
    when input.to_i > 0
      puts "crystal info"
    else
      puts "Try one of these options:"
      list
    end
  end

  def purposes
    #get list of purposes
    puts 'Type the number of the purpose to see a list of associated crystals.'
    puts "To go back, type 'menu'."
    input = gets.strip.downcase
    case input
    when menu
      menu
    when input.to_i > 0
      puts "list of crystals"
      # maybe call list?
    else
      puts "Try one of these options:"
      purposes
    end
  end

  def colors
    #get list of colors
    puts 'Type the number of the color to see a list of the associated crystals.'
    puts "To go back, type 'menu'."
    input = gets.strip.downcase
    case input
    when menu
      menu
    when input.to_i > 0
      puts "list of crystals"
      # maybe call list?
    else
      puts "Try one of these options:"
      colors
    end
  end

  def goodbye
    puts "Love and light to you, my dear. Goodbye!"
  end

  # maybe add navigation method for instructions to get rid of repetition

end
