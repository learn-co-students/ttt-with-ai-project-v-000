class StartTheGame

  def initialize
    puts "*~*~*~*~*~*~~**~*~*~*~*~*~*~*~*"
    puts "*~* Welcome to Tic Tac Toe! *~*"
    puts "*~*~*~*~*~*~~**~*~*~*~*~*~*~*~*"
    game_type
    start
  end

## Game Type Selected ##
  def game_type
    puts "\n"
    puts "Please choose the type of game to play"
    puts "0 - Computer vs Computer"
    puts "1 - Human vs Computer"
    puts "2 - Human vs Human"
    puts "3 - Wargames"
    puts "\n"
    @game_choice = gets.strip
  end

## Start of Game ##
  def start
    case @game_choice
    when "0" 
      zero_player_game
    when "1"
      one_player_game
    when "2"
      two_player_game
    when "3"
      war_games
    end
  end
## End of Game ##
  

## Start of Type of Games ##
  def zero_player_game
    game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
    game.play
    play_again?
  end
  
  def one_player_game
    puts "\nPlayer 1, choose your token: X or 0? X will go first."
    token_input = gets.strip.upcase
    if token_input == "X"
      Game.new(Player::Human.new("X"), Player::Computer.new("O")).play
    elsif token_input == "O"
      Game.new(Player::Computer.new("X"), Player::Human.new("O")).play
    else
      exit
    end
    play_again?
  end
  
  def two_player_game
    puts "\nPlayer 1, choose your token: X or 0? X will go first."
    token_input = gets.strip
    if token_input == "X"
      Game.new(Player::Human.new("X"), Player::Human.new("O")).play
    elsif token_input == "O"
      Game.new(Player::Human.new("O"), Player::Human.new("X")).play
    else
      exit
    end
    play_again?
  end
  
  def war_games
    player_1_win_counter = 0
    player_2_win_counter = 0
    puts "\nThe computer will now play itself 100 times"
    sleep 1
    100.times do
      game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
      game.play
      if game.save_winner == "X"
        player_1_win_counter += 1
      else
        player_2_win_counter += 1
      end
    end
    puts "\nPlayer 1 won #{player_1_win_counter} games"
    puts "Player 2 won #{player_2_win_counter} games"
    play_again?
  end
## End of Type of Games ##

## Start of Play Again ##
  def play_again?
    puts "\nDo you want to play again? (yes/no)"
    answer = gets.strip.downcase
    if answer == "yes"
      game_type
      start
    elsif answer == "no"
      puts "╭∩╮（︶︿︶）╭∩╮"
      puts "\n"
      puts "*~*~*~*~*~*~~**~*~*~*~*~*~*~*~*~*~*~*~*"
      puts "*~* Thanks for playing Tic Tac Toe! *~*"
      puts "*~*~*~*~*~*~~**~*~*~*~*~*~*~*~*~*~*~*~*"
      exit
    else
      play_again?
    end
  end
## End of Play Again ##
  
end