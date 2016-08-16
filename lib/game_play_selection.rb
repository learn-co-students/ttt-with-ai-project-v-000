class GamePlaySelection
  attr_accessor :board, :player_1, :player_2, :game

  def welcome
    puts "Welcome to Tic Tac Toe by Kerry"
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
    if @player_1.class == Players::Computer
      @game = Game.new(@player_1, @player_2, @board)
      player_1.game = self
      player_1.game.board = self.board
    elsif @player_2.class == Players::Computer
      @game = Game.new(@player_1, @player_2, @board)
      player_2.game = self
      player_2.game.board = self.board
    else
      @game = Game.new(@player_1, @player_2, @board)
    end
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

  # def wargames
  #   # If you'd like, implement a "wargames" game type. When asked what kind of game they want to play or for the number of players, if the user types in "wargames", have the computer play itself 100 times and report how many times the game was won. This is not a requirement, it would just be fun. A perfect computer AI should never be able to win, like in the case of thermonuclear war.
  # end
  
end

################### Can't get this to work ~v
    # when "1"
    #   puts "Do you want to go first or second? (enter 1 or 2)"
    #     if gets.strip == "1"
    #       first_player = Players::Human.new("X")
    #       second_player = Players::Computer.new("O")
    #       the_board = Board.new
    #     elsif gets.strip == "2"
    #       first_player = Players::Computer.new("X")
    #       second_player = Players::Human.new("O")
    #       the_board = Board.new
    #     end
    #   @player_1 = first_player
    #   @player_2 = second_player
    #   @board = the_board 