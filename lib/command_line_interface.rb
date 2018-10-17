class TicTacToeInterface
  
  def game
    ai_one = Players::Computer.new("X")
    ai_two = Players::Computer.new("O")
    human_one = Players::Human.new("X")
    
    puts "----------------------".light_blue
    puts "Welcome to Tic Tac Toe!".red
    puts "----------------------".light_blue
    puts "How many players are playing today? 0, 1, or 2?".red
    puts "----------------------".light_blue
    player_number = gets.strip
    
    if player_number == "0"
      Game.new(ai_one, ai_two).play
    elsif player_number == "1"
      puts "Would you like to go first? [Y/N]"
      input = gets.strip
      if input == "y" || input == "yes" || input == "Y" || input == "Yes"
        Game.new(human_one, ai_two).play
      elsif input == "n" || input == "no" || input == "N" || input == "No"
        Game.new(ai_one).play
      else
        puts "Invalid Entry. Please input again..."
        game
      end
    elsif player_number == "2"
      Game.new.play
    else
      puts "Invalid Entry. Please input again..."
      game
    end
    replay?
  end
  
  def exit
    exit
  end
  
  
  def replay?
    puts "Would you like to play again? [Y/N]"
    input = gets.chomp
    
    if input == "y" || input == "yes" || input == "Yes" || input == "Y"
      game
    elsif input == "n" || input == "no" || input == "No" || input == "N"
      exit
    else
      puts "Invalid Entry. Please input again..."
      replay?
    end
  end
  
end