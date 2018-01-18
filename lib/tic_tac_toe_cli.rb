class TicTacToeCLI
  def initialize
  end

 def call
    intro
    define_players
    implement_new_game
    @this_game.play
    keeping_score
    play_again?
  end

  attr_reader :this_game

  @player_1 = nil
  @player_2 = nil
  @comp_player_1 = nil
  @comp_player_2 = nil
  @board = Board.new
  @input = nil
  @num_of_players = nil
  @this_game = nil
  @@x_wins = 0
  @@o_wins = 0
  @@ties = 0

  def intro
    puts "welcome user(s)"
    puts "how many players would like to play: 0, 1, or 2?"
    @num_of_players = gets.chomp
      puts "simply enter the space where you'd like to make your move. They are numbered as follows:"
      puts " 1 | 2 | 3 "
      puts "-----------"
      puts " 4 | 5 | 6 "
      puts "-----------"
      puts " 7 | 8 | 9 "
    puts "who would like to go first: X or O?"
    @input = gets.chomp
  end

  def define_players
    if @input == "X" || @input == "x"
      @player_1 = Player::Human.new("X")
      @player_2 = Player::Human.new("O")
      @comp_player_1 = Player::Computer.new("O")
      @comp_player_2 = Player::Computer.new("X")
    else
      @player_1 = Player::Human.new("O")
      @player_2 = Player::Human.new("X")
      @comp_player_1 = Player::Computer.new("X")
      @comp_player_2 = Player::Computer.new("O")
    end
  end

  def implement_new_game
    @board = Board.new
    if @num_of_players == "2"
      @this_game = Game.new(@player_1, @player_2, @board)
    elsif @num_of_players == "1"
      @this_game = Game.new(@player_1, @comp_player_1, @board)
    else
      @this_game = Game.new(@comp_player_1, @comp_player_2, @board)
    end
  end

  def play_again?
    puts "would you like to play again: Y or N?"
    play_again = gets.chomp

    if play_again == "Y" || play_again == "y"
      next_game = implement_new_game
      next_game = Start_game.new
      next_game.runner
    else
      puts "goodbye"
    end
  end

  def keeping_score
    if @this_game.winner == "X"
      @@x_wins += 1
    elsif @this_game.winner == "O"
      @@o_wins += 1
    else
      @@ties += 1
    end
    puts "X wins: #{@@x_wins}, O wins: #{@@o_wins}, and ties: #{@@ties}"
  end

end

first_game = Start_game.new
first_game.runner
  end
end
