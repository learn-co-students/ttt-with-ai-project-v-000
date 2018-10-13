class GameFlowController

  def start
    puts "Hi! Welcome to Tic Tac Toe!"
    puts "What type of game would you like to play?"
    puts "1. 0 Player"
    puts "2. 1 Player"
    puts "3. 2 Player"
    puts "Please enter your selection:"
    input = gets.chomp
    if input == "1"
      zero_player
    elsif input == "2"
      one_player
    elsif input == "3"
      two_player
    end
    play_again?
  end

  def zero_player
    game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"), Board.new)
    game.play
  end

  def one_player
    puts "Would you like to be X or O? (X goes first)"
    puts "Please enter X or O:"
    input = gets.chomp
    if input == "X" || input == "x"
      game = Game.new(Players::Human.new("X"), Players::Computer.new("O"), Board.new)
      game.play
    elsif input == "O" || input == "o" || input == "0"
      game = Game.new(Players::Computer.new("X"), Players::Human.new("O"), Board.new)
      game.play
    else
      puts "Invalid input."
      one_player
    end
  end

  def two_player
    game = Game.new
    game.play
  end

  def play_again?
    puts "Would you like to play another game?"
    input = gets.chomp
    if input == "Y" || input == "y"
      start
    elsif input == "N" || input == "n"
      puts "Oh, okay. That's fine."
      sleep(1)
      puts "Goodbye."
    else
      puts "Invalid input."
      play_again?
    end
  end


end
