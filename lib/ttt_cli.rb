class CLIRun

  def call
    puts "Hello! Welcome to Tic Tac Toe!"
    puts "Please, input player mode: 0, 1, or 2"
    player_mode = gets.strip.to_i

    if player_mode == 0
      exit
    elsif player_mode == 1
      puts "Would you like to go first and be 'X'? (y/n)"
      input = gets.strip.downcase
      if input == "yes" || input == "y"
        Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new).play
      elsif input == "no" || input == "n"
        Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new).play
      end
    elsif player_mode == 2
      puts "Would you like to go first and be 'X'? (y/n)"
      input = gets.strip.downcase
      if input == "yes" || input == "y"
        Game.new(Players::Human.new("X"), Players::Human.new("O"), Board.new).play
      elsif input == "no" || input == "n"
        Game.new(Players::Human.new("O"), Players::Human.new("X"), Board.new).play
      end
    end
  end
end
