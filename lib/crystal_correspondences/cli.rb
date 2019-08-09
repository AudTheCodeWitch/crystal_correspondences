# This is my CLI controller
class CLI
  # show welcome message
  def call
    puts 'Gathering potion ingredients...'
    start = Scraper.new
    start.get_crystals
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

  def crystal_info(crystal)
    puts "* * * * *About #{crystal.name} * * * * *"
    puts '- - - - - - - - - - - - - - - - - - - - - - - -'
    puts "Color(s): #{crystal.colors.join(', ').gsub(' Gemstones', '').downcase}"
    puts "\nMetaphysical Use(s): #{crystal.purposes.join(', ').downcase}"
    puts "\nTo learn more about #{crystal.name.downcase}, visit #{crystal.crystal_url}.\n\n"
    puts ' - - - - - - - - - - - - -  - - - - - - - - - -'
  end

  def list
    # get list of crystals
    Crystal.all.each_with_index do |crystal, i|
      puts "#{i + 1}. #{crystal.name}"
    end

    puts "\nTo learn more about a crystal, type the number."
    puts "To go back, type 'menu'."
    input = gets.strip.downcase

    if input == 'menu'
    elsif input.to_i > 0 && (input.to_i - 1) < Crystal.all.length
      index = input.to_i - 1
      crystal = Crystal.all[index]
      crystal_info(crystal)
    else
      puts 'Try one of these options:'
      list
    end
  end

  def purposes
    # get list of purposes
    Purpose.all.each_with_index do |purpose, i|
      puts "#{i + 1}. #{purpose.name}"
    end

    puts "\nType the number of the purpose to see a list of associated crystals."
    puts "To go back, type 'menu'.\n\n"

    input = gets.strip.downcase
    if input == 'menu'
    elsif input.to_i > 0 && (input.to_i - 1) < Purpose.all.length
      index = input.to_i - 1
      p = Purpose.all[index]
      Purpose.crystals(p).each_with_index do |crystal, i|
        puts "#{i + 1}. #{crystal.name}"
      end

      puts "\nTo learn more about a crystal, type the number."
      input = gets.strip.downcase
      if input.to_i > 0 && (input.to_i - 1) < Purpose.crystals(p).length
        index = input.to_i - 1
        crystal = Purpose.crystals(p)[index]
        crystal_info(crystal)
      end
    else
      puts 'Try one of these options:'
      purposes
    end
  end

  def colors
    # get list of colors
    Color.all.each_with_index do |color, i|
      puts "#{i + 1}. #{color.name}"
    end

    puts "\nType the number of the color to see a list of the associated crystals."
    puts "To go back, type 'menu'.\n\n"

    input = gets.strip.downcase
    if input == 'menu'
    elsif input.to_i > 0 && (input.to_i - 1) < Color.all.length
      index = input.to_i - 1
      c = Color.all[index]
      Color.crystals(c).each_with_index do |crystal, i|
        puts "#{i + 1}. #{crystal.name}"
      end

      puts "\nTo learn more about a crystal, type the number."
      input = gets.strip.downcase
      if input.to_i > 0 && (input.to_i - 1) < Color.crystals(c).length
        index = input.to_i - 1
        crystal = Color.crystals(c)[index]
        crystal_info(crystal)
      end
    else
      puts 'Try one of these options:'
      colors
    end
  end

  def goodbye
    puts 'Special thanks to https://beadage.net!'
    puts 'Love and light to you, my dear. Goodbye!'
  end
end
