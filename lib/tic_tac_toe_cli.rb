class TicTacToeCLI
  def start_game
    puts 'Welcome to Tic Tac Toe.'
    puts 'Would you like to play a 0, 1 or 2 player game?'
    puts "Type 0 for: COMPUTER vs COMPUTER"
    puts "Type 1 for: HUMAN vs COMPUTER"
    puts "Type 2 for: HUMAN VS HUMAN"

    input_game_type = gets.strip

    if input_game_type == '0'
      puts "Computer vs Computer!"
      new_game = Game.new(Players::Computer.new('X'), Players::Computer.new('O'))
      new_game.play
    elsif input_game_type == '1'
      puts "Human vs Computer!"
      puts "Type X if you want to be X and go first" 
      puts "Type O if you want to be O and go second."

      input_first_player = gets.strip

      if input_first_player == 'X'
        new_game = Game.new(Players::Human.new('X'), Players::Computer.new('O'))
        new_game.play
      else
        new_game = Game.new(Players::Computer.new('X'), Players::Human.new('O'))
        new_game.play
      end
    elsif input_game_type == '2'
      puts 'Human vs Human. First player is X. Fight!'
      new_game = Game.new
      new_game.play
    else
      puts 'Wrong input. Game over.'
    end
  end
  
  def initialize
    game_on = "yes"
    while game_on == "yes"
      start_game
      puts "Would you like to play again? (yes/no)"
      game_on = gets.strip
      puts " "
    end

    puts "Thank yoiu for playing.  Goodbye."
    puts " "
  end

end