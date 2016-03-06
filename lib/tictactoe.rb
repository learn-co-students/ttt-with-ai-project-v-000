require 'pry'

class TicTacToeCLI
  attr_accessor :first_player, :num_players, :replay_choice, :tally_X, :tally_O
  
  def initialize
    @tally_X = 0
    @tally_O = 0
    call
  end

  def call
    puts "******************************************************"
    puts "Welcome to TicTacToe!"
    puts "Please enter number of players 0,1,2. But don't type 'wargames'"
    puts "0 = computer, 1 = you against computer, 2 = 2 players"
    puts "******************************************************"
    num_players = gets.to_s.strip
     
    if num_players == "0"; computer_vs_computer
    elsif num_players == "1"; human_vs_computer
    elsif num_players == "2"; human_vs_human
    elsif num_players == "wargames"; 
      wargames
      stats
    else
    end
  end
  end


  def computer_vs_computer
    puts "Ok, here goes the battle between Eniac and Hal...."
    game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Computer.new("O"))
    game.board.display
    game.play
    game.board.display
      puts "Play again? y/n"
      replay_choice = gets.strip.upcase
      new_game(replay_choice)
  end

  def human_vs_computer
    puts "You have chosen to play against the Computer."
    puts "Who goes first?    0 = computer    1 = you"
      first_player = gets.to_s.strip
    if first_player == "0"
      game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Human.new("O"))
      game.board.display
      game.play
      game.board.display
        puts "Play again? y/n"
        replay_choice = gets.strip.upcase
        new_game(replay_choice)
    elsif first_player == "1"
      game = Game.new(player_1 = Player::Human.new("X"), player_2 = Player::Computer.new("O"))
      game.board.display
      game.play
      game.board.display
        puts "Play again? y/n"
        replay_choice = gets.strip.upcase
        new_game(replay_choice)
    end
  end

  def human_vs_human
    puts "Ok, 2 players, first player to enter, will be 'X' token."
      game = Game.new(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"))
      game.board.display
      game.play
      game.board.display
        puts "****************"
        puts "Play again? y/n"
        puts "****************"
      replay_choice = gets.strip.upcase
      new_game(replay_choice)
  end

  def new_game(replay_choice)
    if replay_choice == "Y"
      puts "******************************************************"
      puts "Please insert $1 to play again (baby needs new shoes)."
      puts "******************************************************"
      call
    elsif replay_choice == "N"
      puts "*******************************************************************"
      puts "Thank you for playing." 
      puts "Please consider contributing to our TicTacToe Kickstarter Campaign."
      puts "*******************************************************************" 
    else
    end
  end

  def wargames
    game = Game.new(player_1 = Player::Computer.new("X"), player_2 = Player::Computer.new("O"))
    100.times do game.play
    if game.winner == "X"; 
      @tally_X = @tally_X + 1
    elsif game.winner == "O"
      @tally_O = @tally_O + 1 
    else
    end
  end

  def stats
    puts "***************************"
    puts "Game stats are as follows:"
    puts "X won #{tally_X} time(s)."
    puts "O won #{tally_O} time(s)."
    puts "***************************"
  end

end