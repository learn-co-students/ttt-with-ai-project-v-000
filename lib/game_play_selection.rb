class GamePlaySelection
  attr_accessor :board, :player_1, :player_2

  def welcome
    puts "Welcome to Tic Tac Toe by Kerry"
  end

  def players
    puts "Player 1 will be 'X'. How many players? (enter 1 or 2, or 0 if you want to watch 2 computers play against each other)"
    players_count = gets
    case players_count
    when "0"
      @player_1 = Players::Computer.new("X")
      @player_2 = Players::Computer.new("O")
      @board = Board.new
    when "1"
      puts "Do you want to go first or second? (enter 1 or 2)"
      if gets == "1"
        @player_1 = Players::Human.new("X")
        @player_2 = Players::Computer.new("O")
        @board = Board.new
      elsif gets == "2"
        @player_1 = Players::Computer.new("X")
        @player_2 = Players::Human.new("O")
        @board = Board.new
      end
    when "2"
      @player_1 = Players::Human.new("X")
      @player_2 = Players::Human.new("O")
      @board = Board.new
    end
  end

  def play_game
    GamePlay.new(player_1, player_2, board)
  end

  def play_again?
    puts "Would you like to play again? (Y or N)"
    if gets == "Y"
      self.players
      self.play_game
    else
      puts "Thanks for playing!"
    end
  end

  # def wargames
  #   # If you'd like, implement a "wargames" game type. When asked what kind of game they want to play or for the number of players, if the user types in "wargames", have the computer play itself 100 times and report how many times the game was won. This is not a requirement, it would just be fun. A perfect computer AI should never be able to win, like in the case of thermonuclear war.
  # end
  
end


# class GamePlaySelection
#   attr_accessor :game_attributes

#   def welcome
#     puts "Welcome to Tic Tac Toe by Kerry"
#   end

#   def players
#     puts "How many players? (enter 1 or 2, or 0 if you want to watch 2 computers play against each other)"
#     players_count = gets
#     case players_count
#     when "0"
#       game_attributes = {:player_1 => Players::Human.new("X"), :player_2 => Players::Human.new("O"), :board => Board.new}
#     when "1"
#       game_attributes = {:player_1 => Players::Human.new("X"), :player_2 => Players::Human.new("O"), :board => Board.new}
#     when "2"
#       game_attributes = {:player_1 => Players::Human.new("X"), :player_2 => Players::Human.new("O"), :board => Board.new}
#     end
#   end

#   def play_game
#     GamePlay.new(game_attributes)
#   end

#   def play_again?
#     puts "Would you like to play again? (Y or N)"
#     if gets == "Y"
#       self.players
#     else
#       puts "Thanks for playing!"
#     end
#   end

#   # def wargames
#   #   # If you'd like, implement a "wargames" game type. When asked what kind of game they want to play or for the number of players, if the user types in "wargames", have the computer play itself 100 times and report how many times the game was won. This is not a requirement, it would just be fun. A perfect computer AI should never be able to win, like in the case of thermonuclear war.
#   # end
  
# end