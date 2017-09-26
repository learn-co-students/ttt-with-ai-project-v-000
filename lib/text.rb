module Text
  def menu_prompts
    puts "Enter '1' to play against your friend (or yourself)."
    puts "Enter '2' to play against the AI."
    puts "Enter '3' to watch the AI play against itself."
    puts "Enter 'exit' to exit."
  end

  def prompt
    puts "\nEnter 1 - 9..."
  end

  def human_text
    puts "\nHey...\n"
    puts "\n\n( ͡° ͜ʖ ͡°)\n\n"
    puts "Whoever's first is 'X'."
    puts "Your friend (or the AI) will be 'O'."
  end

  def ai_text
    puts "Ok...you can watch two AIs play. Sure. Yeah."
  end

  def invalid_alert
    puts "\n(-(-_(-_-)_-)-) Not a valid move. (-(-_(-_-)_-)-) \n"
  end

  def taken_alert
    puts "\nThat position's taken. Pick another number.\n"
  end

  def celebrate_text
    puts "\n       ▂▃▅▇█▓▒░۩۞۩        ۩۞۩░▒▓█▇▅▃▂\n\n"
  end

  def divider_text
    puts "\n================================\n\n"
  end
end
