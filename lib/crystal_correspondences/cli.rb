# This is my CLI controller
class CLI
  # show welcome message
  def call
    puts 'Gathering potion ingredients...'
    start = Scraper.new
    start.get_crystals
    puts 'Sprinkling pixie dust...'
    puts 'This may take a few minutes (magic takes time)...'
    start.scrape_properties
    puts 'Welcome, beautiful spirit!'
    menu
  end

  def show_options

    puts "To see a list of crystals, type 'list'."
    puts "To see crystals by their purpose, type 'purpose'."
    puts "To see crystals by their color, type 'color.'"
    puts "To exit, type 'exit'."
  end
  # show menu
  def menu
    input = nil
    while input != 'exit'
      show_options
      input = gets.strip.downcase
      case input
      when 'list'
        list
      when 'purpose'
        purposes
      when 'color'
        colors
      when 'exit'
        goodbye
      else
        puts 'Try one of these options:'
        menu
      end
    end
  end

  def list
    # get list of crystals
    Crystal.all.each_with_index do |crystal, i|
      puts "#{i + 1}. #{crystal.name}"
    end
    puts ''
    puts 'To learn more about a crystal, type the number.'
    puts "To go back, type 'menu'."
    input = gets.strip.downcase

    if input == 'menu'
    elsif input.to_i > 0
      index = input.to_i - 1
      crystal = Crystal.all[index]
      puts "* * * * *About #{crystal.name} * * * * *"
      puts ' - - - - - - - - - - - - - - - - -  - - - - - - - - - -'
      puts "Colors: #{crystal.colors.join(', ').gsub(' Gemstones', '').downcase}"
      puts ''
      puts "Metaphysical Uses: #{crystal.purposes.join(', ').downcase}"
      puts ''
      puts ' - - - - - - - - - - - - - - - - -  - - - - - - - - - -'
    else
      puts 'Try one of these options:'
      list
    end
  end

  def purposes
    #get list of purposes
    Purpose.all.each_with_index do |purpose, i|
      puts "#{i + 1}. #{purpose.name}"
    end
    puts ''
    puts 'Type the number of the purpose to see a list of associated crystals.'
    puts "To go back, type 'menu'."
    puts ''
    input = gets.strip.downcase
    if input == 'menu'
    elsif input.to_i > 0
      index = input.to_i - 1
      puts 'list of crystals'
    else
      puts 'Try one of these options:'
      purposes
    end
  end

  def colors
    #get list of colors
    Color.all.each_with_index do |color, i|
      puts "#{i + 1}. #{color.name}"
    end
    puts ''
    puts 'Type the number of the color to see a list of the associated crystals.'
    puts "To go back, type 'menu'."
    puts ''
    input = gets.strip.downcase
    if input == 'menu'
    elsif input.to_i > 0
      index = input.to_i - 1
      puts 'list of crystals'
    else
      puts 'Try one of these options:'
      colors
    end
  end

  def goodbye
    puts 'Love and light to you, my dear. Goodbye!'
  end

  # maybe add navigation method for instructions to get rid of repetition

end
