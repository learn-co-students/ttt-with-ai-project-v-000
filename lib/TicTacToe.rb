class TicTacToe

  def initialize
    puts "Welcome to Tic Tac Toe!"
  end

  def start
    puts "How many players will be playing this round?"
    input = gets.chomp
    if input = 0
      Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
    elsif input = 1
        puts "Great, you will be playing against the computer. Would you like to go first or second?"
        input_2 = gets.chomp
        if input_2 = "first"
          Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Computer.new("O"), board = Board.new)
        elsif input_2 = "second"
          Game.new(player_1 = Players::Computer.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
        end
    elsif input = 2
      Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    end
    play_again?
  end

  def play_again?
    puts "Thanks for playing! Would you like to play again? y/n"
    input = gets.chomp
    if input == "y"
      start
    else
      exit
    end
  end







end
