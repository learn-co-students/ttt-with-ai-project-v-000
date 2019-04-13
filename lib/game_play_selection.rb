class GamePlaySelection
  attr_accessor :board, :player_1, :player_2, :game

  def call
    welcome
    players
    play_game
    play_again?
  end

  def welcome
    puts "Welcome to Tic Tac Toe"
  end

  def players
    puts "Player 1 will be 'X'. How many players? (enter 1 or 2, or 0 if you want to watch 2 computers play against each other)"
    players_count = gets.strip
    case players_count
    when "0"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
      @board = Board.new
    when "1"
      puts "Cool, you go first"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Computer.new("O")
      @board = Board.new
    when "2"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
      @board = Board.new
    end
    self.play_game(player_1, player_2, board)
  end

  def play_game(player_1, player_2, board)
    @game = Game.new(@player_1, @player_2, @board)
  end

  def play_again?
    puts "Would you like to play again? (Y or N)"
    if gets.strip == "Y"
      self.players
      self.game.play
      play_again?
    else
      puts "Thanks for playing!"
    end
  end

end
