class GamePlay

  def welcome
    puts "Welcome to Tic Tac Toe by Kerry"
  end

  def players
    puts "How many players? (enter 1 or 2, or 0 if you want to watch 2 computers play against each other)"
    players_count = gets
    case players_count
    when "0"
      Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      puts "Great, X goes first"
    when "1"
      Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      puts "Great, X goes first" 
    when "2"
      Game.new(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
      puts "Great, X goes first"
    end
  end

  def play_again?
    puts "Would you like to play again? (Y or N)"
    if gets == "Y"
      players
    else
      puts "Thanks for playing!"
    end
  end

  # def wargames
  #   # If you'd like, implement a "wargames" game type. When asked what kind of game they want to play or for the number of players, if the user types in "wargames", have the computer play itself 100 times and report how many times the game was won. This is not a requirement, it would just be fun. A perfect computer AI should never be able to win, like in the case of thermonuclear war.
  # end
  
end